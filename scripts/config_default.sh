[[ -z "$HBICLI_BASE_DIR" ]] && { echo "Error: HBICLI_BASE_DIR is not set"; exit 1; }

# Root directory of cloned repositories
: ${ROOT_DIR:=${HBICLI_BASE_DIR}/../..}
export ROOT_DIR

#
# Ports
#
: ${DB_PORT:="5432"}
export DB_PORT

: ${KAFKA_PORT:="29092"}
export KAFKA_PORT

: ${ELASTICSEARCH_PORT:="9200 9300"}
export ELASTICSEARCH_PORT

: ${XJOIN_PORT:="4000"}
export XJOIN_PORT

#
# Services
#
DEFAULT_SERVICES=(
    "insights-host-docker"
    "elasticsearch-docker"
    "insights-host-mq_service"
    "xjoin"
    "insights-host-web_service"
)
export DEFAULT_SERVICES

: ${SERVICES_TO_START:=${DEFAULT_SERVICES[@]}}
export SERVICES_TO_START

: ${TMUX_SESSION_NAME:="HostInv"}
export TMUX_SESSION_NAME

: ${INSIGHTS_HOST_DIR:="$ROOT_DIR/insights-host-inventory"}
export INSIGHTS_HOST_DIR

: ${INSIGHTS_HOST_DOCKER_FILE:="dev.yml"}
export INSIGHTS_HOST_DOCKER_FILE

: ${INSIGHTS_HOST_DOCKER_PROJECT:="insights-host-inventory"}
export INSIGHTS_HOST_DOCKER_PROJECT

: ${INSIGHTS_HOST_DOCKER_SERVICES:="db zookeeper kafka"}
export INSIGHTS_HOST_DOCKER_SERVICES

: ${XJOIN_DIR:="$ROOT_DIR/xjoin-search"}
export XJOIN_DIR

: ${ELASTICSEARCH_DOCKER_FILE:="docker-compose.yml"}
export ELASTICSEARCH_DOCKER_FILE

: ${ELASTICSEARCH_DOCKER_SERVICES:="elasticsearch"}
export ELASTICSEARCH_DOCKER_SERVICES

: ${ELASTICSEARCH_DOCKER_PROJECT:="elasticsearch"}
export ELASTICSEARCH_DOCKER_PROJECT
