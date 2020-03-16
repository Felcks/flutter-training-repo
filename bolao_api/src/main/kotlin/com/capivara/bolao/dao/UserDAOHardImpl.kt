package com.capivara.bolao.dao

import com.capivara.bolao.model.User
import org.springframework.stereotype.Repository
import java.util.*

@Repository("userHardDAO")
class UserDAOHardImpl : UserDAO {

    companion object {
        private val userList: MutableList<User> = mutableListOf()
    }

    override fun insertUser(id: UUID, user: User): User {
        val u = user.apply { this.id = id }
        userList.add(u)
        return u
    }

    override fun insertUser(user: User): User {
        return super.insertUser(user)
    }

    override fun getAllUser(): List<User> {
        return userList
    }

    override fun selectUserById(id: UUID): User? {
        return userList.first { it.id?.equals(id) == true }
    }

    override fun updateUser(id: UUID, user: User): Int {
        selectUserById(id).also {
            val index = userList.indexOf(it)
            if (index >= 0) {
                userList[index] = user.apply { this.id = id }
                return 1;
            }
        }
        return 0
    }

    override fun deleteUser(id: UUID): Int {
        val user = selectUserById(id)
        userList.remove(user)
        return 1;
    }
}