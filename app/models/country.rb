class Country < ActiveHash::Base
  self.data = [
    { id: 0,  name: '--', area: '--', image: '' },
    { id: 1,  name: 'ベトナム', area: 'アジア', image: '/assets/countries/Vietnam.png' },
    { id: 2,  name: 'フィリピン', area: 'アジア', image: '/assets/countries/Philippines.png' },
    { id: 3,  name: 'インドネシア', area: 'アジア', image: '/assets/countries/Indonesia.png' },
    { id: 4,  name: 'インド', area: 'アジア', image: '/assets/countries/India.png' },
    { id: 5,  name: 'イエメン', area: 'アジア', image: '/assets/countries/Yemen.png' },
    { id: 6,  name: 'エチオピア', area: 'アフリカ', image: '/assets/countries/Ethiopia-1387b19c176f32402931a3a1412d63487033ab61053db2a5a777272ad279a751.png' },
    { id: 7,  name: 'ルワンダ', area: 'アフリカ', image: '/assets/countries/Rwanda.png' },
    { id: 8,  name: 'ケニア', area: 'アフリカ', image: '/assets/countries/Kenya.png' },
    { id: 9,  name: 'タンザニア', area: 'アフリカ', image: '/assets/countries/Tanzania.png' },
    { id: 10, name: 'ウガンダ', area: 'アフリカ', image: '/assets/countries/Uganda.png' },
    { id: 11, name: 'ブラジル', area: '南アメリカ', image: '/assets/countries/Brazil.png' },
    { id: 12, name: 'コロンビア', area: '南アメリカ', image: '/assets/countries/Colombia-adb178784c8a9cca28da3db36f136f601f13de1bf5d330a1b85c6096d7761373.png' },
    { id: 13, name: 'ペルー', area: '南アメリカ', image: '/assets/countries/Perou.png' },
    { id: 14, name: 'ドミニカ共和国', area: '中央アメリカ', image: 'public/assets/countries/Dominican-Republic-b5bbd84ab4bbecde3a83ae30e51a17935bfee4e850419a50e6c90c86a01cb828.png' },
    { id: 15, name: 'ジャマイカ', area: '中央アメリカ', image: '/assets/countries/Jamaica.png' },
    { id: 16, name: 'ニカラグア', area: '中央アメリカ', image: '/assets/countries/Nicaragua.png' },
    { id: 17, name: 'コスタリカ', area: '中央アメリカ', image: 'public/assets/countries/Costa-Rica-6b918dbd94cbdfc6c2f34f7f484f1bae7abcfed789e27a55351c8b292d4a00b8.png' },
    { id: 18, name: 'ホンジュラス', area: '中央アメリカ', image: '/assets/countries/Honduras.png' },
    { id: 19, name: 'エルサルバドル', area: '中央アメリカ', image: 'public/assets/countries/El-Salvador-35b279e6c255bf98bd7819560fa4339662219df471de100584b96f397c6dabf9.png' },
    { id: 20, name: 'グァテマラ', area: '中央アメリカ', image: 'public/assets/countries/Guatemala-2398b40faa40988551dc3eba805f36ca8e3045e36a73891185ac40c60e66177e.png' },
    { id: 21, name: 'アメリカ', area: '北アメリカ', image: '/assets/countries/United-States-of-America.png' }
  ]
end
