package com.capivara.bolao.model

import com.fasterxml.jackson.annotation.JsonProperty
import java.util.*
import javax.validation.constraints.NotBlank

class Team(@JsonProperty("id")
           var id: UUID?,
           @JsonProperty("name")
           @field:NotBlank
           var name: String,
           @JsonProperty("image_url")
           @field:NotBlank
           var imageURL: String)