class Country < ActiveHash::Base
  self.data = [
    { id: 0,  name: '--', area: '--', image: '' },
    { id: 1,  name: 'ベトナム', area: 'アジア', image: '/assets/countries/Vietnam.png' },
    { id: 2,  name: 'フィリピン', area: 'アジア', image: '' },
    { id: 3,  name: 'インドネシア', area: 'アジア', image: '' },
    { id: 4,  name: 'インド', area: 'アジア', image: '' },
    { id: 5,  name: 'イエメン', area: 'アジア', image: '' },
    { id: 6,  name: 'エチオピア', area: 'アフリカ', image: '' },
    { id: 7,  name: 'ルワンダ', area: 'アフリカ', image: '' },
    { id: 8,  name: 'ケニア', area: 'アフリカ', image: '' },
    { id: 9,  name: 'タンザニア', area: 'アフリカ', image: '' },
    { id: 10, name: 'ウガンダ', area: 'アフリカ', image: '' },
    { id: 11, name: 'ブラジル', area: '南アメリカ', image: '' },
    { id: 12, name: 'コロンビア', area: '南アメリカ', image: '' },
    { id: 13, name: 'ペルー', area: '南アメリカ', image: '' },
    { id: 14, name: 'ドミニカ共和国', area: '中央アメリカ', image: '' },
    { id: 15, name: 'ジャマイカ', area: '中央アメリカ', image: '' },
    { id: 16, name: 'ニカラグア', area: '中央アメリカ', image: '' },
    { id: 17, name: 'コスタリカ', area: '中央アメリカ', image: '' },
    { id: 18, name: 'ホンジュラス', area: '中央アメリカ', image: '' },
    { id: 19, name: 'エルサルバドル', area: '中央アメリカ', image: '' },
    { id: 20, name: 'グァテマラ', area: '中央アメリカ', image: '' },
    { id: 21, name: 'アメリカ', area: '北アメリカ', image: '' }
  ]
end
