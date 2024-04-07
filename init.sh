#/bin/bash

AppName="Test 1"
AppNameSafe="Test1"
GUID="`uuidgen -s -N $AppNameSafe-proj -n @x500`"
SolutionGUID="`uuidgen -s -N $AppNameSafe-sln -n @x500`"
echo "AppName=$AppName"
echo "AppNameSafe=$AppNameSafe"
echo "GUID=$GUID"
echo "SolutionGUID=$SolutionGUID"

rm -rf ./out
mkdir ./out

cp -R ./Properties ./out/Properties
cp -R ./Main.cs ./out/Main.cs
cp -R ./plugin.json ./out/plugin.json
cp -R ./plugin.json ./out/plugin.json
cp -R ./PowerToys.Run.Template.csproj ./out/PowerToys.Run.$AppNameSafe.csproj
cp -R ./PowerToys.Run.Template.sln ./out/PowerToys.Run.$AppNameSafe.sln

sed -i "s/\${{AppName}}/$AppName/g" `grep -rl '${{AppName}}' ./out/`
sed -i "s/\${{AppNameSafe}}/$AppNameSafe/g" `grep -rl '${{AppNameSafe}}' ./out/`
sed -i "s/\${{GUID}}/$GUID/g" `grep -rl '${{GUID}}' ./out/`
sed -i "s/\${{SolutionGUID}}/$SolutionGUID/g" `grep -rl '${{SolutionGUID}}' ./out/`

rm -rf ./out/Images
mkdir ./out/Images
cp -R ./Images/Template.dark.png ./out/Images/$AppNameSafe.dark.png
cp -R ./Images/Template.light.png ./out/Images/$AppNameSafe.light.png
cp -R ./Lib ./out/Lib