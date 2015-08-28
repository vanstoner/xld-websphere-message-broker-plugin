# Preface #

This documented describes the WebSphere Message Broker Plugin which supports deployments to Message Broker.

NOTE: This is not considered complete or production ready at this time.

See the **XL Deploy Reference Manual** for background information on XL Deploy and deployment concepts.

## Requirements ##

* **Requirements**
    * **XL Deploy** 5.0.1 or above

## Installation ##

Place the plugin JAR file into your `SERVER_HOME/plugins` directory.  

## Types ##

+ messagebroker.MessageBroker
  * `brokerSpec` Which Message Broker specficiation this is for, usually this is the `brokerName` of a locally defined broker

+ messagebroker.BAR - Type for a BAR Archive
  * `executionGroup` - Which Execution Group this BAR should go to 
  * `flowName` - Which Message Flow this BAR describes
  * `timeoutSecs` - Timeout for operations with this BAR, default is `60`
