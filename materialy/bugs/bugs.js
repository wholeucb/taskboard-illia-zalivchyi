
const zadania = [
  { tytul: 'Struktura repozytorium', status: 'done' },
  { tytul: 'Skrypt bazy danych', status: 'done' },
  { tytul: 'API tablic', status: 'in_progress' },
  { tytul: 'Widok tablicy', status: 'todo' },
  { tytul: 'Raport testów', status: 'todo' }
];

function policzWykonane(lista) {
  let licznik = 0;

   // Bylo <=, a powinno byc <
  for (let i = 0; i < lista.length; i++) {
     
    // Bylo = zamiast ===
    if (lista[i].status === 'done') {
      licznik++;
    }
  }
  return licznik;
}

function pokazPodsumowanie() {

  // Bylo zadanie zamiast zadania
  const wykonane = policzWykonane(zadania);
  const procent = Math.round((wykonane / zadania.length) * 100);
  document.getElementById('wynik').textContent = `Wykonane: ${wykonane} z ${zadania.length} (${procent}%)`;
}

// Bylo clik zamiast click
document.getElementById('policz').addEventListener('click', pokazPodsumowanie);
