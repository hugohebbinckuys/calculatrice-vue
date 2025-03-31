<script setup>
import { ref, defineEmits } from 'vue';


let bouton = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, "+", "/", "*", "-", "C", "="]
let operators = ["+", "/", "*", "-"]

const emit = defineEmits(['dataToSend'])

const leftOp = ref(0)
const leftFini = ref(false)
const rightOp = ref(0)
const rightFini = ref(false)
const operation = ref("")

const sendDataToParent = (elts) => {
    emit('dataToSend', elts)
}

const dataToEmit = ref([]) 

const retourZero = () => {
    console.log("Valeurs retournées à zéro" )
    leftOp.value = 0
    rightOp.value = 0
    operation.value = "+"
    leftFini.value = false
    rightFini.value = false
    dataToEmit.value = []
}

const envoyerData = () => {
    dataToEmit.value.push(leftOp.value, operation.value, rightOp.value) // ajout des elements dans la liste des elements qu'on va emit 
    sendDataToParent(dataToEmit) // appel de la fonction qui emit 
}

const op = (elt) => {
    if (elt === "C"){
        retourZero()
        envoyerData() 
    }
    else if (elt === "="){
        rightFini.value = true
        envoyerData() 
        retourZero()
    }
    else if (operators.includes(elt)){
        console.log("<< BoutonCalculatrice >> operatur : " + elt)
        operation.value = elt
        envoyerData() 
        leftFini.value = true
    }
    else if (!leftFini.value){
        leftOp.value*=10
        leftOp.value+=elt
        envoyerData() 
        console.log("<< BoutonCalculatrice >> leftOp : " + leftOp.value)
    }
    else {
        rightOp.value*=10
        rightOp.value+=elt
        envoyerData() 
        console.log("<< BoutonCalculatrice >> rightOp : " + rightOp.value)
    }

}

</script>

<template>

<div class="conteneurBouton">
    <div class="bouton" v-for="element in bouton" @click="op(element)"> {{ element }} </div>
</div>

</template>

<style>
.conteneurBouton {
    display: grid; 
    grid-template-columns: repeat(4, 1fr);
    gap: 10px;
    max-width: 200px;
    margin: auto;
    padding: 20px;
    background: #f3f3f3;
    border-radius: 10px;
    box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
}

.bouton {
    display: flex;
    justify-content: center;
    align-items: center;
    background: #fff;
    border: 1px solid #ddd;
    padding: 15px;
    font-size: 18px;
    font-weight: bold;
    cursor: pointer;
    border-radius: 5px;
    transition: 0.2s;
}

.bouton:hover {
    background: #e0e0e0;
}
</style>
