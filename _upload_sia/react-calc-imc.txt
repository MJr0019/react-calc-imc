import React from 'react';
import {Text, View, StyleSheet, TextInput, TouchableOpacity} from 'react-native';

export default class App extends React.Component{
  
  state = {
    peso: 0,
    altura: 0,
    resultado: 0,
  };
  
  calcular = this.calcular.bind(this);
  calcular(){
let imc = (Number(this.state.peso) / (Number(this.state.altura)*Number(this.state.altura)));
    let s = this.state
    s.resultado = imc
    if(s.resultado < 18.5){
     s.resultadoText ='Abaixo do peso'
   }
    else if (s.resultado < 24.9){
     s.resultadoText ='Peso normal'
    }
    else if (s.resultado < 29.9){
     s.resultadoText ='Obesidade Grau I'
    }
    else if (s.resultado < 34.9 ) {
     s.resultadoText ='Obesidade Grau II'
    }
    else if (s.resultado > 35) {
     s.resultadoText ='Obesidade Grau III'
    } 
   this.setState(s)
  }

  render(){
    return(
      <View style={styles.container}>
        <Text style={styles.textoInicio}>Teste de IMC</Text>

        <View style={styles.containerInputs}>
          <TextInput
          style={styles.input2}
          placeholder='Sua Altura (m)'
          onChangeText={(altura) => this.setState({altura})}/>
        </View>

        <TextInput
          style={styles.input1}
          placeholder='Seu Peso (kg)'
          onChangeText={(peso) => this.setState({peso})}/>

        <View style={styles.containerBotoes}>
          <TouchableOpacity style={styles.botao} onPress={this.calcular}>
            <Text style={styles.textoBotao}>Calcular</Text>
          </TouchableOpacity>
        </View>

        <View>
          <Text style={styles.textoResultado}>IMC: {this.state.resultado.toFixed(2)}</Text>
          <Text style={[styles.resultadoIMC]}>{this.state.resultadoText}</Text>
          
        </View>


      </View>
    );
  }
}

const styles = StyleSheet.create({
    container:{
      flex: 1,
      backgroundColor: '#f5e9ea',
      alignItems: 'center',
      justifyContent: 'center',
    }, 
    input1:{
      borderWidth: 2,
      borderColor: 'black',
      textAlign: 'center',
      fontSize: 20,
      marginBottom:5,
      marginTop: 15,
      borderRadius: 10,
      width: 150,
      padding: 5,
    },
    input2:{
      borderWidth: 2,
      borderColor: 'black',
      textAlign: 'center',
      fontSize: 20,
      marginBottom:5,
      marginTop: 15,
      borderRadius: 10,
      width: 150,
      padding: 5,
    },
    botao:{
      backgroundColor: '#9f0101',
      width: 120,
      height: 50,
      textAlign: 'center',
      justifyContent: 'center',
      borderRadius: 20,
      marginBottom: 15,
      marginTop: 10,
    
    },
    textoBotao:{
      textAlign: 'center',
      fontWeight: 'bold',
      lineHeight: 30,
      color: 'white',
      fontSize: 20,
    },
    textoInicio:{
      color: 'white',
      backgroundColor: '#9f0101',
      borderRadius: 20,
      padding: 15,
      fontWeight: 'bold',
      fontSize: 30,
      textAlign: 'center',
    },
    textoResultado:{
      fontSize: 30,
      fontWeight: 'bold',
      marginBottom: 5,
      marginTop: 15,
      textAlign: "center",
    },
    containerInputs:{
      flexDirection: 'row'
    },
    containerBotoes:{
      flexDirection: 'row',
      width: 250,
      justifyContent: "space-around",
    },
    resultadoIMC: {
      fontSize: 30,
      textAlign: "center",
    }
  });