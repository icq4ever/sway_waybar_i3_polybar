" ===== 기본 표시 =====
set number                      " 라인 번호
" set relativenumber            " 상대 번호 원하면 주석 해제
set cursorline                  " 현재 줄 강조
"set colorcolumn=80              " 80열 가이드
set signcolumn=yes              " 진단/깃 사인 영역 항상 표시

" ===== 문법/파일타입 =====
syntax on                       " 문법 하이라이트
filetype plugin indent on       " 파일타입별 플러그인/들여쓰기
set termguicolors               " true color (터미널 지원 시)
"set background=dark             " 다크 배경 기준
colorscheme molokai              " 기본 제공 테마(원하면 바꿔도 됨: elflord, evening 등)

" ===== 들여쓰기/탭 =====
set expandtab                   " 탭 대신 스페이스
set tabstop=2
set shiftwidth=2
set softtabstop=2
set autoindent
set smartindent

" ===== 검색 =====
set ignorecase                  " 소문자 검색은 대소문자 무시
set smartcase                   " 대문자 포함하면 구분
set incsearch                   " 증분 검색
set hlsearch                    " 검색 결과 하이라이트
nnoremap <Esc><Esc> :nohlsearch<CR> " ESC 두 번으로 하이라이트 해제

" ===== 편의 =====
set mouse=a                     " 마우스 사용
set clipboard=unnamedplus       " 시스템 클립보드 연동
set undofile                    " 영구 undo
set backspace=indent,eol,start  " 백스페이스 편하게
set splitright | set splitbelow " 창 분할 방향 기본값
set scrolloff=3                 " 위아래 여백

" ===== 입력/완성 =====
set wildmenu
set wildmode=longest:full,full

" ===== 상태줄 =====
set laststatus=2                " 항상 상태줄 표시
set ruler                       " 커서 위치 표시

" ===== 공백 가시화 (원하면 켜기) =====
" set list
" set listchars=tab:»·,trail:·,extends:…,precedes:…

" ===== Makefile 같은 탭 필수 파일 예외 =====
" ~/.vim/after/ftplugin/make.vim 파일을 만들고 아래 한 줄:
"   setlocal noexpand

