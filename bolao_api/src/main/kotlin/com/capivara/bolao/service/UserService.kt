package com.capivara.bolao.service

import com.capivara.bolao.dao.UserDAO
import com.capivara.bolao.model.User
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.beans.factory.annotation.Qualifier
import org.springframework.stereotype.Service
import java.util.*

@Service
class UserService @Autowired constructor(@Qualifier("userHardDAO") val userDAO: UserDAO) {

    fun addUser(user: User): User {
        return userDAO.insertUser(user)
    }

    fun getAllUser(): List<User> {
        return userDAO.getAllUser()
    }

    fun updateUser(id: UUID, user: User): Int {
        return userDAO.updateUser(id, user)
    }
}