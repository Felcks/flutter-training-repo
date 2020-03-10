package com.example.demo

import org.springframework.stereotype.Controller
import org.springframework.ui.Model
import org.springframework.web.bind.annotation.GetMapping
import java.util.*
import kotlin.collections.set


@Controller
class HtmlController {

    @GetMapping("/")
    fun blog(model: Model):  HashMap<String, Any> {
        val map = HashMap<String, Any>()
        map["key1"] = "value1"
        map["results"] = "a"
        return map
    }

}