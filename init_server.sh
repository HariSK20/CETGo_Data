cd ..
git clone https://github.com/divyaSrsh/CollegeNavigationSystem.git
git clone https://github.com/HariSK20/CET_Go_server
cd CET_Go_server
python3 -m pip install -r requirements.txt
gunicorn wsgi:app
cd ../CollegeNavigationSystem
sudo apt install npm
npm install -g npm@latest
npm install
npm run build
npm start
