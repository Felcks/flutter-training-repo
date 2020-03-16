package com.capivara.bolao.api

import com.capivara.bolao.model.User
import com.capivara.bolao.service.ChampionshipService
import com.capivara.bolao.service.UserService
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.lang.NonNull
import org.springframework.web.bind.annotation.*
import javax.validation.Valid

@RequestMapping("api/v1/user")
@RestController
class UserController @Autowired constructor(val userService: UserService) {

    @PostMapping
    fun postUser(@Valid @NonNull @RequestBody user: User): User{
        return userService.addUser(user)
    }

    @GetMapping
    fun getAllUser(): List<User>{
        return userService.getAllUser()
    }

}