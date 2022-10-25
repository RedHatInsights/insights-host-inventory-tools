# insights-host-inventory-tools
The tools in this repository help facilitate the setup and
execution of various host based inventory services in local
development environments.

## Setup
The simplest way to set this up is to clone this repository to the same parent directory as the other repositories required by HBI. For example:
<pre>
.
└── my_local_repositories
    ├── insights-host-inventory
    ├── <strong>insights-host-inventory-tools</strong>
    └── xjoin-search
</pre>
Note, this repository, **`insights-host-inventory-tools`**, has been cloned to the same parent directory as the `insights-host-inventory` and `xjoin-search` repositories. With this structure, the tools will work out of the box with default settings. However, the tools can be configured to access the repositories anywhere they may be.
## Command Line Interface
The command line interface is provided by the `hbicli` command, which resides in the `scripts` directory of this repository. The command can be executed via its path, or by its simple name - if `scripts` is in your $PATH.
### Synopsis
<pre>
<b>hbicli</b> [<b>-l commands</b> | <b>services</b>] [<b>-x</b>] <i>command</i> [<i>service</i>]
</pre>

### Description
The **hbicli** utility performs various operations (commands) on one or more of the services that make up the HBI environment.

#### Options

>##### -l commands | services
>>List the supported **commands** or **services**.

>##### -x
>>Enable shell execution debug output.

#### Commands
This is the list of the currently supported commands. This list will be expanded in the future as needed.

>##### **start**
>>Start the specified service.

>##### **stop**
>>Stop the execution of the specified service.

>##### **terminate**
>>Terminate the specified service. This is like **stop** but it also frees aassociated resources as appropriate. For example, when docker containers are involved, they are shut down and removed. As opposed to the **stop** command, where the containers are only stopped.

#### Services
The initial set of supported services is listed below. Additional services will be added in the future to add functionality to the local environment.

>##### **elasticsearch-docker**
>>The container providing the elasticsearch services required by **xjoin**.

>##### **insights-host-docker**
>>Containers providing the following services required by HBI:

>>>DB - postgresql

>>>Kafka

>>>Zookeeper

>##### **insights-host-mq_service**
>##### **insights-host-web_service**

>> The HBI API web service.

>##### **xjoin**

>>The xjoin service required by **insights-host-web_service**.

## Configuration
The operation and behavior of this facility is governed by a number of
environment variable settings. The default values of these
variables are defined in the file `config_default.sh`,
which resides in the same directory as the `hbicli` command. The default
values can be overridden by either setting them in your environment, or
setting them in a user-defined `config.sh` file. If this file exists in
the same directory as `config_default.sh`, then it is sourced by `hbicli`
before `config_default.sh` is sourced.

### Environment Variables
The variables that define the behavior of this facility are as follows:

#### HBICLI_BASE_DIR
> This variable contains the directory in which the `hbicli` command resides. It is set by the command and cannot be overridden.

#### ROOT_DIR
> This is the directory where the requisite repositories reside.
>> Its default value is: `${HBICLI_BASE_DIR}/../..`

#### INSIGHTS_HOST_DIR
> The directory where the `insights-host-inventory` repository resides.
>> By default, it's set to: `$ROOT_DIR/insights-host-inventory`.

#### INSIGHTS_HOST_DOCKER_FILE
> The simple file name of the docker_compose file for the services required by `insights-host-inventory`. It is always assumed to reside
in the `$INSIGHTS_HOST_DIR` directory.
>> The default setting for this variable is: `dev.yml`.

#### INSIGHTS_HOST_DOCKER_SERVICES
> The set of services, started by `docker-compose`, for `insights-host-inventory`, based on `$INSIGHTS_HOST_DOCKER_FILE`.
>> By default, these services are: `db`, `zookeeper` and `kafka`.

#### DB_PORT
> The port through which the Postgresql database is accessed.
>> Default: `5432`.

#### KAFKA_PORT
> The port through which the Kafka service is accessed.
>> Default: `29092`.

#### XJOIN_DIR
> The directory where the `xjoin-search` repository resides.
>> By default, it's set to: `$ROOT_DIR/xjoin-search`.

#### XJOIN_PORT
> The port through which the `xjoin-search` service is accessed.
>> By default: `4000`.

#### ELASTICSEARCH_DOCKER_FILE
> The simple file name of the docker_compose file for the services required by `xjoin-search`. It is always assumed to reside
in the `$XJOIN_DIR` directory.
>> The default setting for this variable is: `docker-compose.yml`.

#### ELASTICSEARCH_DOCKER_SERVICES
> The set of services, started by `docker-compose`, for `xjoin-search`, based on `$ELASTICSEARCH_DOCKER_FILE`.
>> By default, these services are: `elasticsearch`.

#### ELASTICSEARCH_PORT
> The port(s) through which the `elasticsearch` service is accessed.
>> By default: `9200` and `9300`.

#### SERVICES_TO_START
> The services to which commands are applied when no specific services are specified on the command line.
>> Default services:
```
    insights-host-docker
    elasticsearch-docker
    insights-host-mq_service
    xjoin
    insights-host-web_service
```
> For example: `hbicli start` will start all of the services listed above.
