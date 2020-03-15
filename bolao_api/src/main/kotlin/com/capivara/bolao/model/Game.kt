package com.capivara.bolao.model

import com.fasterxml.jackson.annotation.JsonProperty
import java.util.*

class Game(@JsonProperty("id")
           var id: UUID?,
           @JsonProperty("championship_id")
           val championship: UUID,
           @JsonProperty("round_number")
           val roundNumber: Int,
           @JsonProperty("owner_team")
           val ownerTeam: GameTeam,
           @JsonProperty("visiting_team")
           val visitingTeam: GameTeam
)