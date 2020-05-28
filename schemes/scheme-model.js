
const knex = require('knex');
const knexConfig = require('../knexfile.js');
const db = knex(knexConfig.development);


function find() {
    return db('schemes')
}

function findById(id) {
    return db('schemes').where({ id: Number(id) });
  }

  function findSteps(id) {
    return db('steps').join('schemes', 'schemes.id', '=', 'steps.scheme_id').select('steps.id', 'schemes.scheme_name', `steps.step_number`, 'steps.instructions').where('scheme_id', id).orderBy('steps.step_number')
  }

  //select id, scheme_name, step_number, instructions from steps
//inner join schemes on schemes.id = steps.scheme_id
//where scheme_id = 5
//order by step_number

function add(scheme) {
    return db('schemes').insert(scheme, 'id').then(ids => ({ id: ids[0] }))
}

function update(changes, id) {
    return db('schemes').where('id', Number(id)).update(changes)
}

function remove(id) {
    return db('schemes').where('id', Number(id)).del()
}

module.exports = {
    find,
    findById, 
    findSteps,
    add, 
    update, 
    remove
  }