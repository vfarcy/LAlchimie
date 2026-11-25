# 👥 Pour les collaborateurs

## Bienvenue sur L'Alchimie !

Ce document présente rapidement la structure du projet et comment naviguer la documentation.

---

## 🎲 Qu'est-ce que L'Alchimie ?

Un **jeu de déduction logique** jouable dans un navigateur. Les joueurs doivent découvrir une combinaison secrète en déduisant parmi 125 possibilités (5³).

- **Jeu** : https://vfarcy.github.io/LAlchimie/
- **Source** : `index.html` (single file, HTML+CSS+JS)
- **Déploiement** : GitHub Pages (automatic via GitHub Actions)

---

## ✨ Nouveauté : Validation mathématique Lean 4

Le projet inclut maintenant une **preuve mathématique formelle** validant les deux Serments d'Or du jeu :

1. ✅ **Unicité** : Chaque énigme valide → exactement 1 solution
2. ✅ **Non-redondance** : Chaque indice (carte) indispensable

### Exécuter la validation

```bash
# Proof principale
lean demo_final.lean

# Affichage détaillé du filtrage progressif
lean demo_detaille.lean
```

**Résultat** : Affiche 125 rencontres, puis filtre progressif jusqu'à 1 solution.

---

## 📚 Structure de la documentation

### Pour commencer (accès progressif)

| Temps | Fichier | Contenu |
|-------|---------|---------|
| **2 min** | [LEAN_QUICKSTART.md](LEAN_QUICKSTART.md) | Démarrage rapide |
| **5 min** | [LEAN_RESUME.md](LEAN_RESUME.md) | Résumé exécutif |
| **15 min** | [LEAN_VALIDATION_COMPLETE.md](LEAN_VALIDATION_COMPLETE.md) | Explication complète |
| **Avancé** | [LEAN_PROOF.md](LEAN_PROOF.md) | Théorèmes formels |

### Pour auditer le projet

- [AUDIT.md](AUDIT.md) - Checklist d'audit (15 vérifications)
- [AUDIT_BEFORE_AFTER.md](AUDIT_BEFORE_AFTER.md) - Avant/après
- [CHECKLIST_FINALE.md](CHECKLIST_FINALE.md) - État final complet

### Pour committer

- [COMMIT_GUIDE.md](COMMIT_GUIDE.md) - Instructions git

---

## 🗂️ Structure du projet

```
L'Alchimie/
│
├── 🎮 APPLICATION WEB
│   ├── index.html              ← Jeu complet (single file)
│   ├── .github/                ← GitHub Actions
│   └── README.md               ← MISE À JOUR avec Lean 4
│
├── 🧮 VALIDATION MATHÉMATIQUE LEAN 4
│   ├── alchimie/               ← Projet Lean (compilable)
│   ├── demo_final.lean         ← 🚀 Exécution (commencer ici)
│   └── demo_detaille.lean      ← Affichage détaillé
│
├── 📖 DOCUMENTATION LEAN (par durée)
│   ├── LEAN_QUICKSTART.md      (2 min)
│   ├── LEAN_RESUME.md          (5 min)
│   ├── LEAN_VALIDATION_COMPLETE.md (15 min)
│   └── LEAN_PROOF.md           (avancé)
│
├── 📋 AUDIT & PROJET
│   ├── AUDIT.md                (checklist)
│   ├── AUDIT_BEFORE_AFTER.md   (comparaison)
│   ├── CHECKLIST_FINALE.md     (vérifications)
│   ├── COMMIT_GUIDE.md         (git instructions)
│   └── .gitignore              (exclusions)
│
└── 👥 COLLABORATION
    └── CONTRIBUTORS.md         ← Vous êtes ici !
```

---

## 🔄 Workflow typique

### Je veux jouer

```
1. Ouvrir https://vfarcy.github.io/LAlchimie/
2. Choisir intensité (Tendre, Passionné, Fusionnel)
3. Jouer ! 🎲
```

### Je veux comprendre le jeu

```
1. Lire README.md → "Règle du jeu"
2. Essayer le jeu
3. Ouvrir "Banc d'Épreuve" pour voir l'audit interne
```

### Je veux vérifier la solvabilité (Lean)

```
1. LEAN_QUICKSTART.md (2 min)
2. lean demo_final.lean (voir les résultats)
3. LEAN_RESUME.md (5 min, comprendre)
4. LEAN_VALIDATION_COMPLETE.md (15 min, approfondir)
```

### Je veux modifier le jeu

```
1. Éditeur : Ouvrir index.html
2. Modifier JavaScript (logique du jeu)
3. Tester localement : python -m http.server 8000
4. Vérifier avec Banc d'Épreuve (bouton intégré)
5. Commit → GitHub Actions déploie automatiquement
```

### Je veux modifier la validation Lean

```
1. Éditer demo_final.lean ou alchimie/Alchimie/ProofOfUniqueness.lean
2. Compiler : cd alchimie && lake build
3. Tester : lean demo_final.lean
4. Commit et push
```

---

## ✅ Vérifications avant de committer

```bash
# Vérifier que le jeu fonctionne
python -m http.server 8000
# Ouvrir http://localhost:8000 et jouer

# Vérifier que la validation Lean fonctionne
lean demo_final.lean
lean demo_detaille.lean

# Vérifier .gitignore
git status

# Vérifier qu'aucun fichier obsolète
git ls-files | grep "demo.lean\|demo_simple.lean"  # Doit être vide

# Faire le commit
git commit -m "..."
git push
```

---

## 📊 Résultats de l'audit

```
✅ Cardinalité       : 125 rencontres exactes
✅ Unicité           : Chaque énigme → 1 solution
✅ Non-redondance    : Chaque indice indispensable
✅ Solvabilité       : Aucune énigme insoluble
✅ Documentation     : 100% à jour
✅ Nettoyage         : Aucun fichier obsolète
```

---

## 🔧 Ressources

- **Site officiel** : https://vfarcy.github.io/LAlchimie/
- **Repository** : https://github.com/vfarcy/LAlchimie
- **Lean 4** : https://lean-lang.org/
- **GitHub Actions** : Configuration dans `.github/workflows/`

---

## ❓ Questions fréquentes

**Q: Dois-je installer Lean pour jouer ?**
A: Non ! Lean est optionnel. Le jeu fonctionne dans n'importe quel navigateur.

**Q: Est-ce que Lean est requis pour développer le jeu ?**
A: Non ! Vous pouvez modifier index.html sans toucher à Lean. Lean valide seulement la solvabilité.

**Q: Comment cela marche, Lean ?**
A: Lean génère les 125 rencontres, filtre par condition, compte les solutions. Avec les bonnes conditions → exactement 1 solution.

**Q: Où commencer pour contribuer ?**
A: Lisez [README.md](README.md), puis jouez, puis décidez ce que vous voulez améliorer.

---

## 🎓 Pour en savoir plus

- Application web → [README.md](README.md) (Règle du jeu, Technique)
- Validation Lean → [LEAN_QUICKSTART.md](LEAN_QUICKSTART.md) (2 min)
- Audit complet → [AUDIT.md](AUDIT.md)

---

**Bienvenue à bord ! 🎲✨**
