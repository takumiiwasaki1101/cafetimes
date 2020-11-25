class Country < ActiveHash::Base
  self.data = [
    { id: 0,  name: '--', area: '--', image: '' },
    { id: 1,  name: 'ベトナム', area: 'アジア', image: '/assets/Vietnam.png' },
    { id: 2,  name: 'フィリピン', area: 'アジア', image: '/assets/Philippines.png' },
    { id: 3,  name: 'インドネシア', area: 'アジア', image: '/assets/countries/Indonesia.png' },
    { id: 4,  name: 'インド', area: 'アジア', image: '/assets/countries/India.png' },
    { id: 5,  name: 'イエメン', area: 'アジア', image: '/assets/countries/Yemen.png' },
    { id: 6,  name: 'エチオピア', area: 'アフリカ', image: '/assets/countries/Ethiopia.png' },
    { id: 7,  name: 'ルワンダ', area: 'アフリカ', image: '/assets/countries/Rwanda.png' },
    { id: 8,  name: 'ケニア', area: 'アフリカ', image: '/assets/countries/Kenya.png' },
    { id: 9,  name: 'タンザニア', area: 'アフリカ', image: '/assets/countries/Tanzania.png' },
    { id: 10, name: 'ウガンダ', area: 'アフリカ', image: '/assets/countries/Uganda.png' },
    { id: 11, name: 'ブラジル', area: '南アメリカ', image: '/assets/Brazil.png' },
    { id: 12, name: 'コロンビア', area: '南アメリカ', image: '/assets/countries/Colombia.png' },
    { id: 13, name: 'ペルー', area: '南アメリカ', image: '/assets/countries/Perou.png' },
    { id: 14, name: 'ドミニカ共和国', area: '中央アメリカ', image: '/assets/countries/Dominican-Republic.png' },
    { id: 15, name: 'ジャマイカ', area: '中央アメリカ', image: '/assets/countries/Jamaica.png' },
    { id: 16, name: 'ニカラグア', area: '中央アメリカ', image: '/assets/countries/Nicaragua.png' },
    { id: 17, name: 'コスタリカ', area: '中央アメリカ', image: '/assets/countries/Costa-Rica.png' },
    { id: 18, name: 'ホンジュラス', area: '中央アメリカ', image: '/assets/countries/Honduras.png' },
    { id: 19, name: 'エルサルバドル', area: '中央アメリカ', image: '/assets/countries/El-Salvador.png' },
    { id: 20, name: 'グァテマラ', area: '中央アメリカ', image: '/assets/countries/Guatemala.png' },
    { id: 21, name: 'アメリカ', area: '北アメリカ', image: '/assets/countries/United-States-of-America.png' }
  ]
end
