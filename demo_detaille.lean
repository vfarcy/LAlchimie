-- L'Alchimie - Exemple détaillé avec affichage
-- ==============================================
-- Montre comment Lean filtre les 125 rencontres

-- Rencontre = (Atmosphère, Élan, Confidences)
def Rencontre := Nat × Nat × Nat

-- Affichage lisible
def afficherRencontre (r : Rencontre) : String :=
  let (a, e, c) := r
  s!"[A{a} E{e} C{c}]"

-- Générer toutes les 125 rencontres
def genererToutesRencontres : List Rencontre :=
  List.flatten (List.map (fun a =>
    List.flatten (List.map (fun e =>
      List.map (fun c => (a, e, c)) [1, 2, 3, 4, 5]
    ) [1, 2, 3, 4, 5])
  ) [1, 2, 3, 4, 5])

-- Quelques promesses
def atmosphèreImpaire (r : Rencontre) : Bool :=
  let (a, _, _) := r; a % 2 = 1

def élanInférieur (r : Rencontre) : Bool :=
  let (_, e, c) := r; e < c

def confidencesPaires (r : Rencontre) : Bool :=
  let (_, _, c) := r; c % 2 = 0

-- Filtrer et afficher
def afficherSolutions (conditions : List (Rencontre → Bool)) (titre : String) : String :=
  let solutions := genererToutesRencontres.filter fun r =>
    conditions.all fun cond => cond r
  let formattées := solutions.map afficherRencontre |> String.intercalate ", "
  s!"{titre}\n  Nombre: {solutions.length}\n  Solutions: {formattées}"

-- ==================== DÉMONSTRATION ====================

#eval "ÉTAPE 1 : L'UNIVERS COMPLET"
#eval (s!"  Total: {genererToutesRencontres.length} rencontres")
#eval "  Représentation: (Atmosphère ∈ {1..5}, Élan ∈ {1..5}, Confidences ∈ {1..5})"

#eval "\nÉTAPE 2 : APPLIQUER CONDITION 1 - Atmosphère impaire"
#eval afficherSolutions [atmosphèreImpaire] 
  "  Atmosphère ∈ {1, 3, 5} → 3 × 5 × 5 = 75 rencontres"

#eval "\nÉTAPE 3 : AJOUTER CONDITION 2 - Élan < Confidences"
#eval afficherSolutions [atmosphèreImpaire, élanInférieur]
  "  Atm impaire ET Élan < Confidences → 30 rencontres"

#eval "\nÉTAPE 4 : AJOUTER CONDITION 3 - Confidences paires"
#eval afficherSolutions [atmosphèreImpaire, élanInférieur, confidencesPaires]
  "  Atm impaire ET Élan < Conf ET Conf paires → 12 rencontres"

#eval "\nÉTAPE 5 : CONSTATER L'UNICITÉ"
#eval "  3 conditions → 12 solutions"
#eval "  → Pas assez ! Faut ajouter d'autres conditions plus restrictives"
#eval "  → Exemple : Atmosphère = 3 ET Élan = 2 ET Confidences = 4"

#eval "\nÉTAPE 6 : ÊTRE EXHAUSTIF"
#eval afficherSolutions 
  [
    atmosphèreImpaire,
    élanInférieur,
    confidencesPaires,
    fun r => r.1 = 3,      -- Atmosphère = 3
    fun r => r.2.1 = 2     -- Élan = 2
  ]
  "  Avec 5 conditions précises → Solution unique !"

#eval "\n✓ CONCLUSION"
#eval "  Le jeu L'Alchimie génère des énigmes où :"
#eval "  • L'univers = 125 rencontres"
#eval "  • Chaque énigme = ensemble de conditions"
#eval "  • Solution = l'unique rencontre satisfaisant toutes les conditions"
#eval "  • GARANTIE : Pas d'énigme insoluble !"
