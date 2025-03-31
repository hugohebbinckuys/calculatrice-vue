<template>
    <div class="calculator">
      <span class="operator">{{ leftOperator }}</span>
      <span class="operation">{{ operation }}</span>
      <span class="operator">{{ rightOperator }}</span>
      <span class="equals">=</span>
      <span class="result">{{ result }}</span>
    </div>
  </template>
  
  <script setup>
  import { computed, ref } from 'vue';
  
  defineProps ({
    result: {
      type: Number,
    }, 
    leftOperator: {
      type: Number,
      default: 0, 
    }, 
    rightOperator: {
      type: Number,
      default: 0, 
    },  
    operation: {
      type: String,
      default: "+",
    } 
  })
  </script>
  
  <style scoped>
  
  .operator {
    margin: 0 5px;
    font-weight: bold;
  }
  
  .operation {
    margin: 0 5px;
    color: #007BFF;
  }
  
  .equals {
    margin: 0 5px;
    font-weight: bold;
    color: #28a745;
  }
  
  .result {
    margin-left: 10px;
    font-weight: bold;
    color: #dc3545;
    font-size: 26px;
  }

  .calculator {
    text-align: center;
    display: flex;
    align-items: center;
    font-family: Arial, sans-serif;
    font-size: 24px;
    color: #333;
  }
  </style>
  