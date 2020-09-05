export const randomA2B = (a, b, int) => {
  const result = Math.random() * (b - a) + a
  return int ? Math.floor(result) : result
}

export const randomA2B2 = (a, b, int) => {
  const result = Math.random() * (b - a) + a
  return int ? Math.floor(result) : result
}
