package com.capivara.bolao.model

import com.fasterxml.jackson.annotation.JsonProperty
import java.util.*

class Game(@JsonProperty("id")
           var id: UUID?,
           @JsonProperty("owner_team")
           val ownerTeam: GameTeam,
           @JsonProperty("visiting_team")
           val visitingTeam: GameTeam)