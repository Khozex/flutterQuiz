import 'package:quizz2/models/questions_models.dart';

List<Question> fisicaQuestions = [
  // Módulo 1 - Perguntas Fáceis
  Question(
    questionText: 'O que é a gravidade?',
    options: [
      'Uma força que atrai os corpos para o centro da Terra',
      'Uma força que repele os corpos',
      'Uma energia',
      'Uma onda'
    ],
    correctOptionIndex: 0,
    moduleNumber: 1,
  ),
  Question(
    questionText: 'Qual é a fórmula da velocidade?',
    options: ['v = d/t', 'v = m/a', 'v = f*d', 'v = m*g'],
    correctOptionIndex: 0,
    moduleNumber: 1,
  ),
  Question(
    questionText: 'O que é um fóton?',
    options: ['Uma partícula de luz', 'Um átomo', 'Uma molécula', 'Um elétron'],
    correctOptionIndex: 0,
    moduleNumber: 1,
  ),
  Question(
    questionText: 'O que é uma onda?',
    options: [
      'Uma perturbação que se propaga em um meio',
      'Uma partícula',
      'Um átomo',
      'Uma molécula'
    ],
    correctOptionIndex: 0,
    moduleNumber: 1,
  ),
  Question(
    questionText: 'Qual é a unidade de medida da força?',
    options: ['Newton', 'Joule', 'Watt', 'Pascal'],
    correctOptionIndex: 0,
    moduleNumber: 1,
  ),
  Question(
    questionText: 'O que é a inércia?',
    options: [
      'A tendência de um corpo em repouso permanecer em repouso',
      'A tendência de um corpo em movimento permanecer em movimento',
      'Ambas as anteriores',
      'Nenhuma das anteriores'
    ],
    correctOptionIndex: 2,
    moduleNumber: 1,
  ),
  Question(
    questionText: 'Qual é a fórmula da aceleração?',
    options: ['a = Δv/Δt', 'a = m*v', 'a = f*d', 'a = v/t'],
    correctOptionIndex: 0,
    moduleNumber: 1,
  ),
  Question(
    questionText: 'O que é o trabalho em física?',
    options: [
      'A energia transferida por uma força ao mover um objeto',
      'A força aplicada em um objeto',
      'A velocidade de um objeto',
      'A aceleração de um objeto'
    ],
    correctOptionIndex: 0,
    moduleNumber: 1,
  ),
  Question(
    questionText: 'O que é energia cinética?',
    options: [
      'A energia de um objeto em movimento',
      'A energia armazenada em um objeto',
      'A energia transferida por uma força',
      'A energia de um objeto em repouso'
    ],
    correctOptionIndex: 0,
    moduleNumber: 1,
  ),
  Question(
    questionText: 'Qual é a fórmula da energia potencial gravitacional?',
    options: ['Epg = mgh', 'Epg = mv²', 'Epg = 1/2 mv²', 'Epg = mg'],
    correctOptionIndex: 0,
    moduleNumber: 1,
  ),

  // Módulo 2 - Perguntas Medianas
  Question(
    questionText: 'Qual é a lei de Newton que fala sobre a inércia?',
    options: [
      'Primeira Lei de Newton',
      'Segunda Lei de Newton',
      'Terceira Lei de Newton',
      'Lei da Gravitação Universal'
    ],
    correctOptionIndex: 0,
    moduleNumber: 2,
  ),
  Question(
    questionText: 'O que é a Lei de Coulomb?',
    options: [
      'A lei que descreve a força entre duas cargas elétricas',
      'A lei que descreve a força entre dois objetos em movimento',
      'A lei que descreve a força de atrito',
      'A lei que descreve a força de tensão'
    ],
    correctOptionIndex: 0,
    moduleNumber: 2,
  ),
  Question(
    questionText: 'Qual é a unidade de medida da pressão?',
    options: ['Pascal', 'Newton', 'Joule', 'Watt'],
    correctOptionIndex: 0,
    moduleNumber: 2,
  ),
  Question(
    questionText: 'O que é um campo elétrico?',
    options: [
      'Uma região do espaço onde uma carga elétrica experimenta uma força',
      'Uma região do espaço onde uma massa experimenta uma força',
      'Uma região do espaço onde uma onda se propaga',
      'Uma região do espaço onde a luz se propaga'
    ],
    correctOptionIndex: 0,
    moduleNumber: 2,
  ),
  Question(
    questionText: 'Qual é a fórmula da lei de Ohm?',
    options: ['V = IR', 'P = IV', 'E = mc²', 'F = ma'],
    correctOptionIndex: 0,
    moduleNumber: 2,
  ),
  Question(
    questionText: 'O que é a refração da luz?',
    options: [
      'A mudança de direção da luz ao passar de um meio para outro',
      'A reflexão da luz em uma superfície',
      'A difração da luz ao passar por uma fenda',
      'A absorção da luz por um objeto'
    ],
    correctOptionIndex: 0,
    moduleNumber: 2,
  ),
  Question(
    questionText: 'O que é um vetor?',
    options: [
      'Uma grandeza que possui magnitude e direção',
      'Uma grandeza que possui apenas magnitude',
      'Uma partícula subatômica',
      'Uma onda'
    ],
    correctOptionIndex: 0,
    moduleNumber: 2,
  ),
  Question(
    questionText: 'Qual é a fórmula da segunda lei de Newton?',
    options: ['F = ma', 'E = mc²', 'V = IR', 'P = IV'],
    correctOptionIndex: 0,
    moduleNumber: 2,
  ),
  Question(
    questionText: 'O que é uma onda sonora?',
    options: [
      'Uma onda que se propaga através de um meio material',
      'Uma onda eletromagnética',
      'Uma onda transversal',
      'Uma onda que não necessita de meio material para se propagar'
    ],
    correctOptionIndex: 0,
    moduleNumber: 2,
  ),
  Question(
    questionText: 'O que é a frequência de uma onda?',
    options: [
      'O número de oscilações por segundo',
      'A distância entre dois picos consecutivos',
      'A altura da onda',
      'A velocidade da onda'
    ],
    correctOptionIndex: 0,
    moduleNumber: 2,
  ),

  // Módulo 3 - Perguntas Difíceis
  Question(
    questionText: 'Qual é a fórmula da energia cinética?',
    options: ['Ec = 1/2 mv²', 'Ec = mv', 'Ec = mgh', 'Ec = mc²'],
    correctOptionIndex: 0,
    moduleNumber: 3,
  ),
  Question(
    questionText: 'O que é a entropia?',
    options: [
      'Uma medida da desordem de um sistema',
      'Uma medida da energia de um sistema',
      'Uma medida da velocidade de um sistema',
      'Uma medida da massa de um sistema'
    ],
    correctOptionIndex: 0,
    moduleNumber: 3,
  ),
  Question(
    questionText: 'O que é a força de Lorentz?',
    options: [
      'A força sobre uma carga elétrica em um campo magnético',
      'A força sobre um corpo em movimento',
      'A força de atrito entre dois corpos',
      'A força de gravidade entre duas massas'
    ],
    correctOptionIndex: 0,
    moduleNumber: 3,
  ),
  Question(
    questionText: 'Qual é a lei da gravitação universal de Newton?',
    options: [
      'F = G(m₁m₂/r²)',
      'F = ma',
      'E = mc²',
      'V = IR'
    ],
    correctOptionIndex: 0,
    moduleNumber: 3,
  ),
  Question(
    questionText: 'O que é a teoria da relatividade?',
    options: [
      'Uma teoria que descreve a relação entre espaço e tempo',
      'Uma teoria que descreve a relação entre massa e energia',
      'Ambas as anteriores',
      'Nenhuma das anteriores'
    ],
    correctOptionIndex: 2,
    moduleNumber: 3,
  ),
  Question(
    questionText: 'O que é a dualidade onda-partícula?',
    options: [
      'O conceito de que partículas subatômicas exibem propriedades tanto de partículas quanto de ondas',
      'O conceito de que ondas podem se comportar como partículas',
      'Ambas as anteriores',
      'Nenhuma das anteriores'
    ],
    correctOptionIndex: 2,
    moduleNumber: 3,
  ),
  Question(
    questionText: 'O que é a constante de Planck?',
    options: [
      'Uma constante que descreve a relação entre a energia de um fóton e sua frequência',
      'Uma constante que descreve a relação entre a massa e a energia',
      'Uma constante que descreve a relação entre a força e a aceleração',
      'Uma constante que descreve a relação entre a pressão e o volume'
    ],
    correctOptionIndex: 0,
    moduleNumber: 3,
  ),
  Question(
    questionText: 'O que é a teoria das cordas?',
    options: [
      'Uma teoria que descreve as partículas subatômicas como cordas vibrantes',
      'Uma teoria que descreve a relação entre espaço e tempo',
      'Uma teoria que descreve a relação entre massa e energia',
      'Uma teoria que descreve a relação entre a força e a aceleração'
    ],
    correctOptionIndex: 0,
    moduleNumber: 3,
  ),
  Question(
    questionText: 'O que é a teoria do Big Bang?',
    options: [
      'A teoria de que o universo se originou de uma explosão cósmica',
      'A teoria de que o universo é estático e eterno',
      'A teoria de que o universo é plano e infinito',
      'A teoria de que o universo é o centro do multiverso'
    ],
    correctOptionIndex: 0,
    moduleNumber: 3,
  ),
  Question(
    questionText: 'O que é a teoria das supercordas?',
    options: [
      'Uma teoria que unifica todas as forças da natureza em uma única teoria',
      'Uma teoria que descreve as partículas subatômicas como cordas vibrantes',
      'Uma teoria que descreve a relação entre espaço e tempo',
      'Uma teoria que descreve a relação entre massa e energia'
    ],
    correctOptionIndex: 0,
    moduleNumber: 3,
  ),
];
  