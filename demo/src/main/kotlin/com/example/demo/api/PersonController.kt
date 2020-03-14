package com.example.demo.api

import com.example.demo.model.Person
import com.example.demo.service.PersonService
import com.sun.istack.NotNull
import org.jetbrains.annotations.NonNls
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.lang.NonNull
import org.springframework.web.bind.annotation.*
import java.util.*
import javax.validation.Valid

@RequestMapping("api/v1/person")
@RestController
class PersonController @Autowired constructor(val personService: PersonService) {

    @PostMapping
    fun postPerson(@Valid @NonNull @RequestBody person: Person): Person{
        personService.addPerson(person)
        return person
    }

    @GetMapping
    fun getAllPeople(): List<Person>{
        return personService.getAllPeople()
    }

    @GetMapping(path = ["{id}"])
    fun getPersonById(@PathVariable("id") id: UUID): Person?{
        return personService.getPersonById(id)
    }

    @DeleteMapping(path = ["{id}"])
    fun deletePersonById(@PathVariable("id") id: UUID) {
        personService.deletePersonById(id)
    }

    @PutMapping(path = ["{id}"])
    fun putPersonById(@PathVariable("id") id: UUID, @Valid @NonNull @RequestBody personToUpdate: Person){
        personService.updatePersonById(id, personToUpdate)
    }
}