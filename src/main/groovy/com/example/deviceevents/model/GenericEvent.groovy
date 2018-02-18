package com.example.deviceevents.model

import groovy.transform.builder.Builder

import java.time.ZonedDateTime

//Generic event that any device can send to the service

@Builder
class GenericEvent {

    private int id;
    private ZonedDateTime utcTime;

}