import 'package:quizz2/models/questions_models.dart';

List<Question> geometriaQuestions = [
  // Módulo 1 - Perguntas Fáceis
  Question(
    questionText: 'O que é um triângulo?',
    options: ['Um polígono de 3 lados', 'Um polígono de 4 lados', 'Um círculo', 'Um quadrado'],
    correctOptionIndex: 0,
    moduleNumber: 1,
  ),
  Question(
    questionText: 'Quantos lados tem um quadrado?',
    options: ['3', '4', '5', '6'],
    correctOptionIndex: 1,
    moduleNumber: 1,
  ),
  Question(
    questionText: 'Qual é a fórmula da área de um retângulo?',
    options: ['base x altura', 'base + altura', 'base / altura', 'base - altura'],
    correctOptionIndex: 0,
    moduleNumber: 1,
  ),
  Question(
    questionText: 'O que é um ângulo reto?',
    options: ['90 graus', '45 graus', '180 graus', '60 graus'],
    correctOptionIndex: 0,
    moduleNumber: 1,
  ),
  Question(
    questionText: 'Qual é a soma dos ângulos internos de um triângulo?',
    options: ['180 graus', '360 graus', '90 graus', '270 graus'],
    correctOptionIndex: 0,
    moduleNumber: 1,
  ),
  Question(
    questionText: 'Qual é o perímetro de um quadrado com lado 5?',
    options: ['20', '15', '25', '10'],
    correctOptionIndex: 0,
    moduleNumber: 1,
  ),
  Question(
    questionText: 'Quantos lados tem um pentágono?',
    options: ['5', '4', '6', '3'],
    correctOptionIndex: 0,
    moduleNumber: 1,
  ),
  Question(
    questionText: 'Qual é a unidade de medida de um ângulo?',
    options: ['Graus', 'Metros', 'Segundos', 'Quilos'],
    correctOptionIndex: 0,
    moduleNumber: 1,
  ),
  Question(
    questionText: 'Qual é a forma de uma bola?',
    options: ['Esfera', 'Cubo', 'Cilindro', 'Cone'],
    correctOptionIndex: 0,
    moduleNumber: 1,
  ),
  Question(
    questionText: 'O que é um círculo?',
    options: ['Uma figura plana delimitada por uma circunferência', 'Um polígono de 3 lados', 'Um polígono de 4 lados', 'Uma figura espacial'],
    correctOptionIndex: 0,
    moduleNumber: 1,
  ),

  // Módulo 2 - Perguntas Medianas
  Question(
    questionText: 'Qual é a fórmula da área de um círculo?',
    options: ['πr²', '2πr', 'πd', 'r²'],
    correctOptionIndex: 0,
    moduleNumber: 2,
  ),
  Question(
    questionText: 'Qual é a soma dos ângulos internos de um quadrado?',
    options: ['360 graus', '180 graus', '90 graus', '270 graus'],
    correctOptionIndex: 0,
    moduleNumber: 2,
  ),
  Question(
    questionText: 'Qual é a fórmula da área de um triângulo?',
    options: ['(base x altura) / 2', 'base x altura', '(base + altura) / 2', 'base - altura'],
    correctOptionIndex: 0,
    moduleNumber: 2,
  ),
  Question(
    questionText: 'Quantos graus tem um ângulo raso?',
    options: ['180 graus', '90 graus', '360 graus', '270 graus'],
    correctOptionIndex: 0,
    moduleNumber: 2,
  ),
  Question(
    questionText: 'Quantos lados tem um hexágono?',
    options: ['6', '4', '5', '3'],
    correctOptionIndex: 0,
    moduleNumber: 2,
  ),
  Question(
    questionText: 'Qual é a fórmula do volume de um cubo?',
    options: ['lado³', 'lado²', 'base x altura', '2 x lado'],
    correctOptionIndex: 0,
    moduleNumber: 2,
  ),
  Question(
    questionText: 'O que é uma hipotenusa?',
    options: ['O lado oposto ao ângulo reto em um triângulo retângulo', 'Um polígono de 5 lados', 'A base de um triângulo', 'A soma dos ângulos internos de um triângulo'],
    correctOptionIndex: 0,
    moduleNumber: 2,
  ),
  Question(
    questionText: 'Qual é a fórmula da circunferência de um círculo?',
    options: ['2πr', 'πr²', 'πd', '2r'],
    correctOptionIndex: 0,
    moduleNumber: 2,
  ),
  Question(
    questionText: 'Quantos lados tem um heptágono?',
    options: ['7', '5', '6', '4'],
    correctOptionIndex: 0,
    moduleNumber: 2,
  ),
  Question(
    questionText: 'Qual é a fórmula da área de um paralelogramo?',
    options: ['base x altura', 'base + altura', 'base / altura', 'base - altura'],
    correctOptionIndex: 0,
    moduleNumber: 2,
  ),

  // Módulo 3 - Perguntas Difíceis
  Question(
    questionText: 'Qual é a fórmula do volume de um cilindro?',
    options: ['πr²h', '2πr', 'πd', 'r²'],
    correctOptionIndex: 0,
    moduleNumber: 3,
  ),
  Question(
    questionText: 'Qual é a soma dos ângulos internos de um pentágono?',
    options: ['540 graus', '360 graus', '180 graus', '270 graus'],
    correctOptionIndex: 0,
    moduleNumber: 3,
  ),
  Question(
    questionText: 'Qual é a fórmula da área de um trapézio?',
    options: ['(base maior + base menor) x altura / 2', '(base maior + base menor) / 2', 'base maior x base menor / 2', 'base maior - base menor x altura'],
    correctOptionIndex: 0,
    moduleNumber: 3,
  ),
  Question(
    questionText: 'Quantos graus tem um ângulo de meia-volta?',
    options: ['180 graus', '90 graus', '360 graus', '270 graus'],
    correctOptionIndex: 0,
    moduleNumber: 3,
  ),
  Question(
    questionText: 'Quantos lados tem um octógono?',
    options: ['8', '6', '7', '5'],
    correctOptionIndex: 0,
    moduleNumber: 3,
  ),
  Question(
    questionText: 'Qual é a fórmula do volume de uma esfera?',
    options: ['(4/3)πr³', '4πr²', 'πr²h', '2πr'],
    correctOptionIndex: 0,
    moduleNumber: 3,
  ),
  Question(
    questionText: 'O que é um ângulo complementar?',
    options: ['Dois ângulos que somam 90 graus', 'Dois ângulos que somam 180 graus', 'Dois ângulos que somam 360 graus', 'Dois ângulos que somam 270 graus'],
    correctOptionIndex: 0,
    moduleNumber: 3,
  ),
  Question(
    questionText: 'Qual é a fórmula da área de um losango?',
    options: ['(diagonal maior x diagonal menor) / 2', 'base x altura', '(base + altura) / 2', 'lado²'],
    correctOptionIndex: 0,
    moduleNumber: 3,
  ),
  Question(
    questionText: 'Quantos lados tem um decágono?',
    options: ['10', '8', '9', '7'],
    correctOptionIndex: 0,
    moduleNumber: 3,
  ),
  Question(
    questionText: 'Qual é a fórmula do volume de um cone?',
    options: ['(1/3)πr²h', 'πr²h', '2πr', 'πd'],
    correctOptionIndex: 0,
    moduleNumber: 3,
  ),
];
