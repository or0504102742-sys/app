# Galaxy Buds Studio

ממשק עברי וערכת התקנה ל-Windows עבור Galaxy Buds, עם יעד ראשוני של **Samsung Galaxy Buds3 FE**.

## התקנה מהירה ב-Windows

1. הורד את הקובץ [Install-Windows.bat](./Install-Windows.bat).
2. לחץ עליו פעמיים ואשר את התקנת GalaxyBudsClient דרך Windows Package Manager.
3. פתח את **GalaxyBudsClient** מתפריט Start.
4. העבר את האוזניות למצב צימוד, בחר אותן באפליקציה ופעל לפי הוראות החיבור.

אם אין במחשב winget, הסקריפט יפתח את [עמוד הגרסאות הרשמי](https://github.com/timschneeb/GalaxyBudsClient/releases/latest), שבו אפשר להוריד את מתקין Windows.

### אם החיבור לא מצליח

1. הורד את [Check-Buds-Connection.ps1](./Check-Buds-Connection.ps1).
2. פתח PowerShell בתיקיית ההורדה והריץ: `powershell -NoProfile -ExecutionPolicy Bypass -File .\\Check-Buds-Connection.ps1`.
3. הסקריפט בודק את מצב Bluetooth, התקנים מזוהים והתקנת GalaxyBudsClient. הוא אינו משנה הגדרות ואינו מתחבר לאוזניות.
4. העתק את הפלט ושלח אותו לתמיכה כדי לאבחן את הבעיה.

## מה חשוב לדעת על השליטה

כדי לא להציג כפתורים מדומים כאילו הם שולטים באוזניות: ממשק הדפדפן `index.html` הוא כרגע אב-טיפוס חזותי, ואינו שולח פקודות ANC / EQ / מגע לאוזניות. לצורך שליטה אמיתית בפקודות הקנייניות של Samsung, ההתקנה משתמשת ב-GalaxyBudsClient — פרויקט קוד פתוח נפרד שמממש תקשורת Bluetooth מסוג SPP/RFCOMM.

בגרסה 5.2.0 נוספה תמיכה ב-Galaxy Buds3 FE, אך היא סומנה על ידי המפתחים כלא נבדקה. לכן אין הבטחה שכל פקודה או תכונה תפעל עם כל גרסת קושחה. יש לבדוק בפועל לאחר החיבור.

- [GalaxyBudsClient – קוד המקור](https://github.com/timschneeb/GalaxyBudsClient)
- [הגרסה האחרונה והמתקין ל-Windows](https://github.com/timschneeb/GalaxyBudsClient/releases/latest)
- [רישיון GPL-3.0 של פרויקט השליטה](https://github.com/timschneeb/GalaxyBudsClient/blob/master/LICENSE)

## פרטיות וחיבור

GalaxyBudsClient הוא פרויקט צד שלישי, לא מוצר רשמי של Samsung. לפי תיעוד הפרויקט יש בו אפשרויות crowdsourcing ודיווח קריסות; אפשר לבדוק ולכבות אותן בהגדרות האפליקציה. אין להשתמש במקביל באפליקציית הניהול של Samsung ובלקוח הזה בזמן החיבור, כי האוזניות אינן יכולות לנהל שני חיבורי ניהול בו-זמנית.

## פיתוח בהמשך

השלב הבא כדי להפוך את Galaxy Buds Studio לאפליקציה עצמאית באמת הוא לשלב מנוע תקשורת תואם GPL-3.0, להתאים את הממשק העברי לפקודות שנתמכות ב-Buds3 FE, ולבדוק כל פעולה מול אוזניות פיזיות. אין בקוד הנוכחי מימוש עצמאי מאומת של פרוטוקול Samsung.
