package com.example.demo.model

import com.fasterxml.jackson.annotation.JsonProperty
import java.util.*
import javax.validation.constraints.NotBlank

data class Person(@JsonProperty("id")
                  var id: UUID?,
                  @JsonProperty("name")
                  @field:NotBlank
                  val name: String);