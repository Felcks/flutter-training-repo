package com.capivara.bolao.model

import com.fasterxml.jackson.annotation.JsonProperty
import java.util.*

class Team(@JsonProperty("id")
           var id: Int?,
           @JsonProperty("name")
           var name: String,
           @JsonProperty("image_url")
           var imageURL: String)