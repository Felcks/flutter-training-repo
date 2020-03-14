package com.capivara.bolao.model

import com.fasterxml.jackson.annotation.JsonProperty
import java.util.*

class GameTeam(@JsonProperty("id")
               var id: UUID?,
               @JsonProperty("team")
               val team: Team,
               @JsonProperty("score")
               val score: Int)