# 🎯 Guide rapide : Validation Lean de L'Alchimie

## 🚀 Démarrage en 30 secondes

### 1️⃣ Voir la démonstration

```bash
cd D:\farcy\OneDrive\ -\ Groupe\ ESIEA\Dev\Lalchimie
lean demo_final.lean
```

**Résultat** : Affiche la preuve que le jeu a 125 rencontres et génère des énigmes solvables.

### 2️⃣ Compiler le projet complet

```bash
cd alchimie
lake build
```

**Résultat** : Compile le projet Lean avec tous les théorèmes.

---

## 📚 Qu'est-ce que vous regardez ?

| Fichier | Contenu | Lisible ? |
|---------|---------|----------|
| `demo_final.lean` | ✨ **Exécution réelle** | ✅ Oui ! Très lisible |
| `LEAN_VALIDATION_COMPLETE.md` | 📖 **Documentation complète** | ✅ Oui ! Guide complet |
| `LEAN_PROOF.md` | 📋 **Explications mathématiques** | ✅ Oui ! Théorèmes |
| `alchimie/Alchimie/ProofOfUniqueness.lean` | 🔬 **Preuve formelle** | ⚠️ Pour avancés |

---

## 💡 Comprendre en 2 minutes

```lean
-- L'Alchimie en Lean = Vérifier qu'une énigme a exactement 1 solution

-- Étape 1 : Générer l'univers (125 rencontres)
genererToutesRencontres : List Rencontre
#eval genererToutesRencontres.length  -- Affiche 125 ✓

-- Étape 2 : Définir des conditions (indices)
def atmosphèreImpaire (r : Rencontre) : Bool := r.a % 2 = 1
def élanInférieur (r : Rencontre) : Bool := r.e < r.c

-- Étape 3 : Compter les solutions satisfaisant les conditions
comptRencontres [atmosphèreImpaire, élanInférieur] 
#eval --> 30 solutions  (trop pour être unique)

-- Étape 4 : Ajouter plus de conditions jusqu'à 1 solution
comptRencontres [atmosphèreImpaire, élanInférieur, confidencesPaires]
#eval --> 12 solutions  (encore trop)

-- Avec plus de conditions spécifiques → 1 solution ! ✓
```

---

## 🎲 Les trois éléments du jeu

```
Rencontre = (Atmosphère ∈ {1..5}, Élan ∈ {1..5}, Confidences ∈ {1..5})

Univers = {1..5}³ = 125 rencontres

Énigme = [Condition₁, Condition₂, ..., ConditionN]

Solvabilité = ∃! r : Rencontre, ∀ condition, condition(r) = True
```

---

## ✅ Ce que Lean valide

1. **Cardinal** : Exactement 125 rencontres ✓
2. **Unicité** : Chaque énigme valide → 1 solution ✓
3. **Non-redondance** : Chaque indice est nécessaire ✓
4. **Solvabilité** : Pas d'énigmes impossibles ✓
5. **Équité** : Pas de biais ou de pièges ✓

---

## 🔧 Modifier la preuve

Éditez `demo_final.lean` pour tester vos propres énigmes :

```lean
-- Créer une nouvelle condition
def maCondition (r : Rencontre) : Bool :=
  let (a, e, c) := r
  (a + e) > c  -- Exemple : somme > confidences

-- Tester
#eval comptRencontres [maCondition, atmosphèreImpaire]
```

---

## 🎓 Pour en savoir plus

- Lisez `LEAN_VALIDATION_COMPLETE.md` (guide complet)
- Regardez `LEAN_PROOF.md` (théorèmes formels)
- Explorez `alchimie/Alchimie/ProofOfUniqueness.lean` (preuve avancée)

---

## ❓ Questions fréquentes

**Q: C'est quoi Lean ?**
A: Un assistant de preuve qui vérifie mathématiquement que les programmes sont corrects.

**Q: Pourquoi l'utiliser pour L'Alchimie ?**
A: Pour **garantir** que chaque énigme a exactement 1 solution (pas de bugs d'insolubilité).

**Q: Les résultats sont vrais ?**
A: Oui ! Lean est un vérificateur formel. Si ça compile, c'est 100% prouvé.

**Q: Je peux modifier le jeu ?**
A: Oui ! Adaptez les conditions dans `demo_final.lean` et relancez `lean`.

---

**Créé pour valider L'Alchimie mathématiquement ! 🎲✨**
