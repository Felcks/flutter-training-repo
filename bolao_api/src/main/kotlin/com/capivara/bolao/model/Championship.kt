package com.capivara.bolao.model

import com.fasterxml.jackson.annotation.JsonProperty
import java.util.*

class Championship(@JsonProperty("id")
                   var id: UUID?,
                   @JsonProperty("name")
                   val name: String,
                   @JsonProperty("season")
                   val season: String,
                   @JsonProperty("current_round")
                   val currentRound: Int,
                   @JsonProperty("type")
                   val type: Int,
                   @JsonProperty("title_image_url")
                   val titleImageUrl: String,
                   @JsonProperty("round_list")
                   val roundList: List<Round>
)