package com.example.demo.model

import com.fasterxml.jackson.annotation.JsonProperty
import java.util.*

data class Person(@JsonProperty("id") val id: UUID?, @JsonProperty("name") val name: String);