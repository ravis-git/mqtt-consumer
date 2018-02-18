package com.example.deviceevents.config

import com.example.deviceevents.rest.DeviceEventService
import org.glassfish.jersey.server.ResourceConfig
import org.springframework.stereotype.Component

import javax.ws.rs.ApplicationPath

/**
 * Created by ravipalakodeti on 11/16/17.
 */
@Component
@ApplicationPath('device-event')
class RestConfigurer extends ResourceConfig {

    RestConfigurer() {
        register(DeviceEventService.class)
    }
}
