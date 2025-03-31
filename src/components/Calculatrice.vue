<script setup>
import BoutonCalulatrice from './BoutonCalulatrice.vue';
import EcranCalculatrice from './EcranCalculatrice.vue';
import { ref } from 'vue';

const leftOp = ref(0)
const rightOp = ref(0)
const operation = ref("")
const result = ref(0)

// ca c pas opti y a mieux a faire mais pas encore vu 
const retourZero = () => {
    console.log("Valeurs retournées à zéro" )
    leftOp.value = 0
    rightOp.value = 0
    operation.value = "+"
}

const resultOfEmit = (data) => {
    console.log("<< Calculatrice >> Voici le retour du Emit : " + data.value) 
    console.log("<< Calculatrice >> Voici le leftOp  : " + data.value[data.value.length-3]) 
    leftOp.value = data.value[data.value.length -3]
    rightOp.value = data.value[data.value.length -1]
    operation.value = data.value[data.value.length -2]
    console.log("<< Calculatrice >> leftOp = " + leftOp.value + " operation = '" + operation.value + "' rightOp = " + rightOp.value)

    if (operation.value === '+' | operation.value === ''){
        result.value = leftOp.value + rightOp.value
    }
    else if (operation.value ==='-'){
        result.value = leftOp.value - rightOp.value
    }
    else if (operation.value ==='*'){
        result.value = leftOp.value * rightOp.value
    }
    else if (operation.value ==='/'){
        result.value = leftOp.value / rightOp.value
    }

    console.log("Resultat de l'operation : " + result.value)
    // retourZero()
}



</script>

<template>
 <BoutonCalulatrice @dataToSend="resultOfEmit"/> 
 <EcranCalculatrice :leftOperator="leftOp" :rightOperator="rightOp" :operation="operation" :result="result"/> 
</template>

