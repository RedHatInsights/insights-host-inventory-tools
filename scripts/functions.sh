function start_svc_in_tmux {
    local svc=$1
    local svc_start="$HBICLI_BASE_DIR/services/${svc}/start.sh"

    if [[ -n "$LOG_DIR" ]]; then
        tmux new-window -t $TMUX_SESSION_NAME -n ${svc} "${svc_start} 2>&1 | tee ${LOG_DIR}/${svc}.log"
    else
        tmux new-window -t $TMUX_SESSION_NAME -n ${svc} "${svc_start}"
    fi
}

function stop_svc_in_tmux {
    local svc=$1
    local svc_stop="$HBICLI_BASE_DIR/services/${svc}/stop.sh"

    if [[ -x "$svc_stop" ]]; then
        $svc_stop
    else
        tmux kill-window -t ${TMUX_SESSION_NAME}:$svc &> /dev/null
    fi
}

function terminate_svc_in_tmux {
    local svc=$1
    local svc_terminate="$HBICLI_BASE_DIR/services/${svc}/terminate.sh"

    if [[ -x "$svc_terminate" ]]; then
        $svc_terminate
    else
        stop_svc_in_tmux $svc
    fi
}

function sort_words {
    echo $1 | xargs -n1 | sort -u | xargs
}

function check_docker_services {
    # local services="$(docker-compose -f $1 ps --services)" # XXX Will not work when services overridden.
    local services=`sort_words "$2"`
    local running="$(docker-compose -f $1 ps --services --filter "status=running" | xargs)"
    running=`sort_words "$running"`

    echo "Waiting for: $services"
    echo "Running:     $running"

    [ "$running" = "$services" ]
    return $?
}

function wait_for_docker_services {
    until check_docker_services $1 "$2"
    do
        sleep 2
    done
    echo "All services have been started."
}

function port_open {
    lsof -i :$1 -P -n | grep LISTEN 2>&1 > /dev/null
    return $?
}

function wait_for_ports {
    for port in $@
    do
        echo "Waiting for port: $port"
        until port_open $port
        do
            echo -n "."
            sleep 2
        done
        echo
        echo "Port: $port ready"
    done
}

function elasticsearch_ready {
    curl -u elastic: http://localhost:$ELASTICSEARCH_PORT > /dev/null 2>&1
    return $?
}

function wait_for_elasticsearch {
    echo "Waiting for elasticsearch"
    until elasticsearch_ready
    do
        echo -n "."
        sleep 2
    done
    echo
    echo "Elasticsearch is ready."
}
