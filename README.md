# insights-host-inventory-tools
The tools in this repository help facilitate the setup and
execution of various host based inventory services in local
development environments.

## Setup
The simplest way to set this up is to clone this repository to the same parent directory as the other repositories required but HBI. For example:
<pre>
.
└── my_local_repositories
    ├── insights-host-inventory
    ├── <strong>insights-host-inventory-tools</strong>
    └── xjoin-search
</pre>
Note here, this repository, **`insights-host-inventory-tools`**, has been cloned to the same parent directory as the `insights-host-inventory` and `xjoin-search` repositories. With this structure, the tools will work out of the box with default settings. However, the tools can be configured to access the repositories anywhere they may be.
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
