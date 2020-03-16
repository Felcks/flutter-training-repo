package com.capivara.bolao.dao

import com.capivara.bolao.model.User
import java.util.*

interface UserDAO {

    fun insertUser(id: UUID, user: User): User

    fun insertUser(user: User): User {
        val id: UUID = UUID.randomUUID()
        return insertUser(id, user)
    }

    fun getAllUser(): List<User>

    fun selectUserById(id: UUID): User?

    fun updateUser(id: UUID, user: User): Int

    fun deleteUser(id: UUID): Int
}