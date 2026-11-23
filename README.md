# L’Alchimie — B. & V.

Jeu de déduction logique jouable dans un navigateur. À partir d’indices dont la vérité est cachée, retrouvez l’unique combinaison secrète parmi 125 possibilités.

## Jouer

Le jeu est disponible sur <https://vfarcy.github.io/LAlchimie/>.

Ouvrez `index.html` dans un navigateur récent. Aucune installation ni compilation n’est nécessaire.

Pour servir le fichier localement, lancez par exemple `python -m http.server 8000` à la racine du projet, puis ouvrez <http://localhost:8000>.

## Règles et fonctionnalités

- Une combinaison comporte trois valeurs de 1 à 5 : l’Atmosphère, l’Élan et les Confidences.
- Choisissez une proposition, puis sondez jusqu’à trois indices par nuit. Une réponse émeraude confirme la loi de l’indice pour cette proposition ; une réponse rubis l’exclut.
- Après le premier indice sondé, la proposition est verrouillée jusqu’à la nuit suivante.
- Les intensités proposent 4, 5 ou 6 indices. Le but est de retrouver la combinaison qui satisfait toutes leurs lois cachées.
- La Carte du Tendre permet d’annoter chaque valeur (neutre, éliminée ou confirmée). Le bouton « Murmure » ouvre aussi des indices progressifs.
- Le Journal conserve les propositions et réponses de la partie en cours. Le banc d’épreuve intégré vérifie les partitions, la génération des énigmes et un solveur logique.

## Partager une partie

Le code « Serment » sert de graine déterministe : deux personnes qui chargent le même code et la même intensité obtiennent la même énigme. Copiez le code avec le bouton prévu à cet effet, puis chargez-le sur l’autre appareil.

La graine n’est pas un mécanisme de sécurité : le jeu et son secret sont calculés dans le navigateur. Elle permet de rejouer ou partager une énigme, pas d’empêcher la triche.

## Technique

- Application statique, sans serveur applicatif ni dépendances installées.
- HTML, styles et JavaScript sont réunis dans `index.html`.
- Tailwind CSS et les polices Cormorant Garamond / Plus Jakarta Sans sont chargés depuis des CDN ; une connexion Internet est donc nécessaire pour obtenir le style complet.
- L’état de la partie, les annotations et les notes libres ne sont pas sauvegardés : recharger la page démarre une nouvelle partie.

## Déploiement

GitHub Pages publie automatiquement la racine de la branche `main`. Chaque modification poussée sur cette branche déclenche une nouvelle publication, sans étape de compilation.

## Audit et vérification

Le banc d’épreuve est accessible depuis le bouton « Banc d’Épreuve ». Il teste les 19 familles d’indices sur les 125 combinaisons, génère 300 énigmes (100 par intensité) et vérifie le solveur sur 60 parties. Lors de l’audit, les **1 034 contrôles** affichés par cette suite ont réussi.

À noter : le compteur « accords encore possibles » de la Carte du Tendre ne lit que les marques posées par le joueur. Il ne recalcule pas les possibilités à partir des réponses du Journal ; utilisez les indices progressifs pour l’aide fondée sur les réponses.

L’application a été vérifiée en la lançant directement dans un navigateur et en exécutant son banc d’épreuve intégré. Tailwind signale dans la console que son CDN est prévu pour le développement ; pour un déploiement de production, il est préférable de compiler les styles plutôt que de dépendre de `cdn.tailwindcss.com`.
