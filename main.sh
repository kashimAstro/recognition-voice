#!/bin/bash
# ziggurats code 
# MAIN da rivedere 

./textToSpeech.sh 'Mi dica..'
./speechToText2.sh
QUESTION=$(cat stt.txt)

SEARCHWEB="cerca"
SEARCHLOCAL="guarda"
RUNCOMMAND="avvia"
LEARNING="apprendimento"

if [[ ${QUESTION} =~ .*${SEARCHWEB}.* ]]; then
    echo "web search"
    ./textToSpeech.sh 'sto' ${QUESTION/cerca/cercando}
    out=`./searchCURL.php $QUESTION`
    #chromium-browser $out & reset
    echo $out
############# DEBUG MODE
elif [[ ${QUESTION} =~ .*${SEARCHLOCAL}.* ]]; then
    echo "local search"
    ./textToSpeech.sh 'sto' ${QUESTION/guarda/cercando} 'sui nostri server: '
############# here serch local server remote server { container, kashim, aruba-ziggurats, dynamica-ziggurats, virtual-container }
elif [[ ${QUESTION} =~ .*${RUNCOMMAND}.* ]]; then
    echo "run command"
    ./textToSpeech.sh 'sto' ${QUESTION/avvia/lanciando}
############# launch application bash command line or gui &
elif [[ ${QUESTION} =~ .*${LEARNING}.* ]]; then
    echo "Learning"
    ./textToSpeech.sh 'cosa devo cercare?'
#    ./speechToText.sh 
#    ${QUESTION}
############ learning 
          #  auto apprendimento
          #  zPI (nome alpha I.A.)
          #
          #  wolfram http://www.wolframalpha.com/  
          #  wolfram apprendimento computazionale, tecnico scientifico 
          #  Esempi di domande per wolfram:
          #                  cerca atomi d'idrogeno 
          #                  cerca entropia
          #                  cerca tavola periodica
          #                  cerca massa sole
          #                  cerca massa aldebaran stella
          #                  cerca PI greco
          #
          #  prima di una request verso walfram assicurarsi del translate language da italiano a inglese con le api di google
          #  il contenuto di walfram sara posizionato in un NOSQL diviso in tabelle per argomento ogni tabella avra un insieme di 
          #  campi creato appositamente per l'argomento.
          #
          #
          #  wikipedia it.wikipedia.org/
          #  wikipedia apprendimento didattico, storico informativo 
          #  Esempi di domande per wikipedia:
          #                  cerca atomi d'idrogeno 
          #                  cerca entropia
          #                  cerca tavola periodica
          #                  cerca massa sole
          #                  cerca massa aldebaran stella
          #                  cerca PI greco
          #
          # i termi di ricerca di wikipedia possono essere simili a quelli wolfram 
          # con la diferenza che i dati immagazinati per l'apprendimento sono solo descritivi
else
    echo "???"
    ./textToSpeech2.sh 'non capisco cosa cercare? i parametri di ricerca consigliati sono: cerca, guarda, avvia, apprendimento.'
    ./main.sh
fi
