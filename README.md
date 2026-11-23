# L’Alchimie — B. & V.

Jeu de déduction logique jouable dans un navigateur. À partir d’indices dont la vérité est cachée, retrouvez l’unique combinaison secrète parmi 125 possibilités.

## Jouer

Le jeu est disponible sur <https://vfarcy.github.io/LAlchimie/>.

Ouvrez `index.html` dans un navigateur récent. Aucune installation ni compilation n’est nécessaire.

Pour servir le fichier localement, lancez par exemple `python -m http.server 8000` à la racine du projet, puis ouvrez <http://localhost:8000>.

## Règle du jeu : l’alchimie amoureuse de B. et de V.

Dans la douceur d’une nuit, B. et V. cherchent l’accord secret qui fait naître leur alchimie. À vous de le découvrir par déduction : chaque Indice du Cœur cache une promesse, et une seule rencontre les satisfait toutes.

### Les trois dimensions de leur rencontre

L’étreinte secrète est une combinaison de trois nuances, chacune numérotée de 1 à 5. Il existe donc **125 rencontres possibles**.

| Nuance | Atmosphère — le décor | Élan — leur manière de se rapprocher | Confidences — ce qu’ils partagent |
|---|---|---|---|
| 1 | Café tamisé | Timide | Souvenirs d’enfance |
| 2 | Pluie tiède | Taquin | Rêves fous |
| 3 | Bougies & musique | Passionné | Un secret inavoué |
| 4 | Galerie déserte | Mystérieux | Le silence complice |
| 5 | Toit sous les étoiles | Troublé | Leur avenir à deux |

Par exemple, **[3 – 2 – 4]** imagine B. et V. à la lueur des bougies, dans un élan taquin, partageant un silence complice.

### Préparer la partie

Choisissez une intensité : **Tendre** présente 4 Indices du Cœur, **Passionné** en présente 5 et **Fusionnel** en présente 6. Changer d’intensité démarre une nouvelle énigme.

Chaque carte d’indice énumère plusieurs promesses possibles, mais une seule est secrètement vraie pour l’étreinte recherchée. Votre mission est de découvrir assez de ces promesses pour retrouver l’unique combinaison qui les respecte toutes.

### Le rituel d’une nuit

1. **Imaginez une rencontre.** Choisissez une valeur pour l’Atmosphère, l’Élan et les Confidences : c’est votre proposition pour la nuit.
2. **Sondez les Indices du Cœur.** Interrogez jusqu’à trois cartes différentes. Chaque interrogation compte pour un **soupir**. Dès la première, votre proposition est scellée : elle ne peut plus être modifiée pendant cette nuit.
3. **Écoutez la réponse.** Une lueur **émeraude** signifie que votre proposition satisfait la promesse secrète de cette carte. Un voile **rubis** signifie qu’elle ne la satisfait pas. La réponse concerne la promesse de la carte, pas directement la justesse de chacun des trois nombres.
4. **Notez vos déductions**, puis passez à la **Nuit suivante** pour essayer une autre proposition. Il faut avoir sondé au moins un indice avant de changer de nuit ; vous n’êtes pas obligé d’en sonder trois.

Une même carte peut être sondée à nouveau lors d’une autre nuit, avec une autre proposition. Le **Journal** conserve les propositions et les réponses obtenues pendant la partie.

### Exemple : écouter les promesses

B. et V. imaginent la rencontre **[3 – 2 – 4]** :

- Une carte propose « Atmosphère paire » ou « Atmosphère impaire ». La réponse est **émeraude** : comme l’Atmosphère proposée est 3, la promesse secrète est « Atmosphère impaire ». Dans la solution, l’Atmosphère est donc 1, 3 ou 5.
- Une autre carte propose « Élan inférieur aux Confidences », « Élan égal aux Confidences » ou « Élan supérieur aux Confidences ». La réponse est **rubis** : la proposition testée vérifie 2 < 4, donc cette promesse est exclue. La promesse secrète est l’égalité ou la supériorité ; d’autres déductions ou sondages permettront de trancher.

Une réponse émeraude sur une carte ne suffit pas à prouver que la rencontre entière est la bonne : elle doit aussi satisfaire les promesses secrètes de toutes les autres cartes.

### Les deux Serments d’Or

- **Unicité :** parmi les 125 rencontres, une seule satisfait simultanément toutes les promesses secrètes.
- **Non-redondance :** chaque indice est indispensable. Si l’on retirait n’importe quelle carte, au moins deux rencontres respecteraient encore les promesses des cartes restantes. Cette garantie peut aider à écarter une hypothèse qui rendrait un indice inutile.

### Garder la trace des intuitions

Sur la **Carte du Tendre**, cliquez sur une nuance pour la marquer comme éliminée, cliquez à nouveau pour la confirmer, puis une troisième fois pour la remettre à l’état neutre. Ces marques sont vos notes personnelles : le compteur d’accords encore possibles se fonde sur elles, et non sur les réponses du Journal.

Le bouton **Murmure** propose trois niveaux d’aide progressive calculés à partir de la partie : ils peuvent éclairer l’espace de recherche, suggérer un indice à sonder ou révéler une nuance à écarter. Ces aides utilisent aussi le secret calculé par le jeu.

### Sceller l’étreinte

Quand vous pensez avoir trouvé l’accord de B. et V., cliquez sur **Sceller l’Étreinte**, choisissez les trois valeurs et confirmez avec **Révéler leur étreinte**. La partie se termine, que votre proposition soit juste ou non : le jeu dévoile la solution, les promesses secrètes et votre bilan en nuits et en soupirs.

Vous pouvez jouer seul, réfléchir ensemble sur le même écran ou comparer vos déductions à deux sur des appareils séparés. Dans ce dernier cas, partagez le même Serment et choisissez la même intensité ; vous pouvez ensuite comparer le nombre de nuits et de soupirs nécessaires.

## Partager une partie

Le code « Serment » sert de graine déterministe : deux personnes qui chargent le même code et la même intensité obtiennent la même énigme. Copiez le code avec le bouton prévu à cet effet, puis chargez-le sur l’autre appareil.

La graine n’est pas un mécanisme de sécurité : le jeu et son secret sont calculés dans le navigateur. Elle permet de rejouer ou partager une énigme, pas d’empêcher la triche.

## Technique

- Application statique, sans serveur applicatif ni dépendances installées.
- HTML, styles et JavaScript sont réunis dans `index.html`.
- Tailwind CSS et les polices Cormorant Garamond / Inter sont chargés depuis des CDN ; une connexion Internet est donc nécessaire pour obtenir le style complet.
- L’état de la partie, les annotations et les notes libres ne sont pas sauvegardés : recharger la page démarre une nouvelle partie.

## Déploiement

Le workflow GitHub Actions publie automatiquement l’application sur GitHub Pages à chaque modification poussée sur `main`. La source de GitHub Pages doit être réglée sur **GitHub Actions**. Le workflow peut aussi être lancé manuellement depuis l’onglet Actions.

Le bas de page affiche l’heure UTC de préparation du déploiement et le numéro d’exécution du workflow, suivi du numéro de tentative. En local, ces informations ne sont pas disponibles. Le fichier source reste inchangé : les métadonnées sont insérées uniquement dans la copie publiée.

## Audit et vérification

Le banc d’épreuve est accessible depuis le bouton « Banc d’Épreuve ». Il teste les 19 familles d’indices sur les 125 combinaisons, génère 300 énigmes (100 par intensité) et vérifie le solveur sur 60 parties. Lors de l’audit, les **1 034 contrôles** affichés par cette suite ont réussi.

À noter : le compteur « accords encore possibles » de la Carte du Tendre ne lit que les marques posées par le joueur. Il ne recalcule pas les possibilités à partir des réponses du Journal ; les indices progressifs tiennent compte de la partie et utilisent également le secret.

L’application a été vérifiée en la lançant directement dans un navigateur et en exécutant son banc d’épreuve intégré. Tailwind signale dans la console que son CDN est prévu pour le développement ; pour un déploiement de production, il est préférable de compiler les styles plutôt que de dépendre de `cdn.tailwindcss.com`.
