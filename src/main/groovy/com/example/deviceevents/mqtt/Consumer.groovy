package com.example.deviceevents.mqtt

import groovy.util.logging.Slf4j
import org.eclipse.paho.client.mqttv3.IMqttDeliveryToken
import org.eclipse.paho.client.mqttv3.MqttCallback
import org.eclipse.paho.client.mqttv3.MqttMessage
import org.springframework.beans.factory.annotation.Value
import org.springframework.stereotype.Component

import javax.annotation.PostConstruct

/*
* MQTT consumer class registers with the broker on the URL provided to it via start command
* */

@Slf4j
@Component
class Consumer implements MqttCallback{

    @Value('${mqtt.broker.url}')
    private String brokerUrl

    @Value('${mqtt.broker.port}')
    private String brokerPort

    @PostConstruct
    def registerWithMQTTBroker() {
        log.debug(" === broker on tcp://${brokerUrl}:${brokerPort}" )
    }

    @Override
    void connectionLost(Throwable cause) {
        log.error("Connection to MQTT broker lost!")
    }

    @Override
    void messageArrived(String topic, MqttMessage message) throws Exception {
        log.info("Message received:\n\t"+ new String(mqttMessage.getPayload()) )
    }

    @Override
    void deliveryComplete(IMqttDeliveryToken token) {

    }
}
