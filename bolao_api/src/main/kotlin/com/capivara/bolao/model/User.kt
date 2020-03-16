package com.capivara.bolao.model

import com.fasterxml.jackson.annotation.JsonProperty
import java.util.*
import javax.validation.constraints.NotBlank

class User(
        @JsonProperty("id")
        var id: UUID?,
        @JsonProperty("name")
        @field:NotBlank
        val name: String
)