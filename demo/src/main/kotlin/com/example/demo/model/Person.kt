package com.example.demo.model

import com.fasterxml.jackson.annotation.JsonProperty
import java.util.*

data class Person(@JsonProperty("id") var id: UUID?, @JsonProperty("name") val name: String);