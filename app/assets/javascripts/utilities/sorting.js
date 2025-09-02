document.addEventListener('turbolinks:load', () => {
  document.querySelector('.sort-by-title')?.addEventListener('click', sortRowsByTitle)
})

const sortRowsByTitle = () => {
  const table = document.querySelector('table')
  const rows = table.querySelectorAll('tr')

  const sortedRows = Array.from(rows).slice(1)

  const arrowUp = document.querySelector('.sort-by-title .octicon-arrow-up')
  const arrowDown = document.querySelector('.sort-by-title .octicon-arrow-down')


  if (arrowUp.classList.contains('d-none')) {
    sortedRows.sort((a, b) => compareRows(a, b, true))
    arrowUp.classList.remove('d-none')
    arrowDown.classList.add('d-none')
  } else {
    sortedRows.sort((a, b) => compareRows(a, b, false))
    arrowDown.classList.remove('d-none')
    arrowUp.classList.add('d-none')
  }

  const sortedTbody = document.createElement('tbody')
  sortedTbody.append(...sortedRows)
  table.querySelector('tbody').replaceWith(sortedTbody)
}

const compareRows = (row1, row2, asc = true) => {
  const text1 = row1.querySelector('td').textContent.trim()
  const text2 = row2.querySelector('td').textContent.trim()
  const order = asc ? 1 : -1
  return text1.localeCompare(text2) * order
}
