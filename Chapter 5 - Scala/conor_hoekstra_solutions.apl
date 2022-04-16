ticTacToeStatus ← {
    i ← 1 5 9 3 5 7,(,⍉3 3⍴⍳9),⍳9
    m ← 1,⍨∨/∧/'XO'∘.=8 3⍴⍵[i]
    ' wins',⍨⊃m/'X' 'O' 'No one'
}