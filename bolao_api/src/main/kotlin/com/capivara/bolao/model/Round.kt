package com.capivara.bolao.model

import com.fasterxml.jackson.annotation.JsonProperty
import java.time.ZonedDateTime
import java.util.*

class Round(@JsonProperty("round_number") //chave primaria
            val roundNumber: Int,
            @JsonProperty("championship_id") //chave primaria
            val championshipID: UUID,
            @JsonProperty("start_date")
            val startDate: ZonedDateTime,
            @JsonProperty("game_list")
            var gameList: List<Game>)