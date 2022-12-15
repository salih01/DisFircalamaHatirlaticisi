//
//  MainViewController.swift
//  DisFircalamaHatirlaticisi
//
//  Created by ALFA on 27.11.2022.
//
import UIKit
import Lottie
import CoreData

class MainViewController: UIViewController {

    // MARK: - UI Elements
    
    @IBOutlet weak var tableView: UITableView!
  
    
    // MARK: - Properties
    // MARK: - Core Data
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    
    var itemCD = [Item]()
    var sendTheIndexPathRow = Int()
    static let shared = MainViewController()

    
    
    
    var mainModels:[MainModels] = []
    var myDetails:[Details] = []
    var chosenDay : Details?


    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
         loadItems()
         tableView.reloadData()
        
        modelsArray()
        
            let details1 = Details(detailsAnimationView: "16", detailsDayLabel: "1. Gün", detailsTextView: "Diş ve diş etlerinin sağlığının korunması için florürlü bir diş macunu ve yumuşak kıllı bir diş fırçası ile dişler günde en az 2 kez 45 derecelik açıyla yukarı ve aşağı hareketlerle fırçalanmalıdır.")
            let details2 = Details(detailsAnimationView: "4", detailsDayLabel: "2. Gün", detailsTextView: "Dişlerinizin beyazlamasını sağlayan karbonat, sirke ve tuz ile hazırladığınız kür, sizlere ilaç gibi gelecek.Üç malzemeyi karıştırın ve fırçanızı bu küre batırıp dişlerinizi fırçalayın.  ")
            let details3 = Details(detailsAnimationView: "2", detailsDayLabel: "3. Gün", detailsTextView: "Potasyum açısından zengin bir meyve olan muzu, dişlerinizi fırçaladıktan sonra beyazlatmak için kullanabilirsiniz.Ufak bir muz kabuğunu alın ve dişlerinize masaj yaparak uygulayın.Tartarları temizleyerek dişinizi beyaz bir görünüme kavuşturacaktır.")
            let details4 = Details(detailsAnimationView: "3", detailsDayLabel: "4. Gün", detailsTextView: "Diş beyazlatma bitkisel çözümleri arasında adaçayını da sayabiliriz.Düzenli olarak adaçayı tüketimi, dişlerin her zaman beyaz kalmasını sağlayacaktır.Dilerseniz 1 çay kaşığı karbonatı, tarçını ve demlenmiş adaçayını karıştırın.Bu karışım ile dişlerinizi düzenli ve aksatmadan fırçalayın.Zamanla dişlerinizin beyazlık kazandığını göreceksiniz.")
            let details5 = Details(detailsAnimationView: "tooth1", detailsDayLabel: "5. Gün", detailsTextView: "Dudak peelingi nasıl yapılır ? 1 tatlı kaşığı bal ile 1 tatlı kaşığı toz şekeri karıştıralım ve dudağımıza dairesel hareketlerle iki dakika kadar masaj yapalım. Ilık su ile durulayıp nemlendirici sürdüğünüzde dudaklarınızın pürüzsüz olduğunu göreceksiniz.Aynı tarife zeytinyağı ekleyerek de bu işlemi gerçekleştirebilirsiniz. 1 tatlı kaşığı bal, 1 tatlı kaşığı zeytinyağı ve 1 tatlı kaşığı esmer şekeri karıştırarak dudaklarınıza masaj yapın. Zeytinyağının nemlendirici etkisi sayesinde dudaklarınız yumuşak ve pürüzsüz olacak.1 tatlı kaşığı toz şeker ve 1 tatlı kaşığı Hindistan cevizi yağını karıştırarak bir iki dakika kadar dudağınıza masaj yapın. Hindistan cevizi yağının da nemlendirici etkisi olduğunu unutmayın.")
            let details6 = Details(detailsAnimationView: "5", detailsDayLabel: "6. Gün", detailsTextView: "Bir parmağınıza birden fazla diş ipi sarmayın. İşaret ve baş parmaklarınız ile diş ipini gererek, diş aralıklarınıza geçirin. İpi koparmamaya ve diş etinize zarar vermemeye özen gösterin. Diş ipinizi “C” şeklinde eğip, dişlerinizi kavrar bir biçimde diş aralıklarınızda aşağı ve yukarı doğru nazik bir şekilde gezdirin.")
            let details7 = Details(detailsAnimationView: "6", detailsDayLabel: "7. Gün", detailsTextView: "Diş fırçalama işlemi ortalama 2 dk sürmeli, her dişin üzeri 8-10 kez fırçalanmalıdır. Diş fırçalarken mutlaka diş diş eti birleşim yeri özellikle fırçalanmalıdır. Amaç diş yüzeyindeki yemek artıklarını, bakteri plağını uzaklaştırmaktır. Diş fırçalamanın ilk adımı doğru fırça seçimidir.")
            let details8 = Details(detailsAnimationView: "7", detailsDayLabel: "8. Gün", detailsTextView: "Sirkeli Gargara nasıl yapılır ? Malzemeler:1 su bardağı içme suyu 2 yemek kaşığı sirke Uygulanışı: Diş fırçalama işleminden sonra uygulamanız önerilen sirkeli gargara, ağızdaki bakterilerin temizlenmesine yardım edecektir.1 su bardağı suyun içine 2 yemek kaşığı sirkeyi ekleyin ve karıştırın. Suyu az miktarda ağız içine alın ve çalkalama işlemine geçin. Çalkalamadan sonra kirli suyu tükürün. Birkaç uygulama sonrasında nefesinizin ferahladığını ve dişlerinizin beyazladığını fark edeceksiniz.")
            let details9 = Details(detailsAnimationView: "30", detailsDayLabel: "9. Gün", detailsTextView: "Malzemeler:2 bardak içme suyu,3 adet kuru karanfil, 1 – 2 damla çay ağacı yağı,Çay Ağacı Yağı Nasıl Kullanılır? Ne İşe Yarar? Uygulanışı: Bir cezve içine tüm malzemeleri ekleyin ve kısık ateşte birkaç dakika ısıtın.Isıtma işleminden sonra karışımın soğumasını bekleyin. Bu karışımı 3 gün boyunca muhafaza edebileceğiniz için kapalı bir şişeye aktarabilirsiniz. Soğuyan gargara suyunu süzerek dilediğiniz bir cam şişeye alın. Diş fırçalama işleminden sonra birkaç yudum bu karışımı ağzınızda çalkalayın. Düzenli kullanım sonrasında çürüklere engel olup daha ferah nefese kavuşabilirsiniz.")
            let details10 = Details(detailsAnimationView: "9", detailsDayLabel: "10. Gün", detailsTextView: "Yapılan araştırmalara göre, sigara diş eti hastalığına yakalanma riskini 4 kat artırır. Sigara içen kişilerde lekeler nedeniyle diş yüzeyleri pürüzlü hale gelip plak birikimi görülür. Diş eti ceplerinde iltihaba neden olan bakteri sayılarındaki artış kemik kayıplarını da beraberinde getirerek ‘periodontitis’e (diş etindeki iltihabın ilerleyip diğer dokuları da etkileyecek şekilde kemik erimesine yol açması) yol açabilir. Sigara ayrıca bağışıklık sisteminde enfeksiyonlara neden olabilir, bakterilere karşı savaşan nötrofil hücrelerinin etkinliğini ve antikor üretimini azaltır, bu da diş eti hastalıklarına zemin hazırlar.")
            let details11 = Details(detailsAnimationView: "31", detailsDayLabel: "11. Gün", detailsTextView: "Dişlerdeki gıda artıkları doğru şekilde temizlenmediğinde yüzeyler pürüzlü hale gelerek bakteri birikimine zemin hazırlar. Diş-diş eti birleşimine yerleşen bakteriler, zararlı maddeler üreterek diş eti hastalıklarına neden olur. Bakteri plağı uzaklaştırılamadığı takdirde tükürükteki minerallerle sertleşir ve ‘diş taşı’ adı verilen kireçsi bir tabaka oluşur. Bu yüzeyin girintili çıkıntılı olması, yeni plağın tutunmasına zemin hazırlar. Diş taşlarının kaldırılıp pürüzsüz bir yüzey elde edilmesi ancak diş taşı temizliğiyle mümkündür.")
            let details12 = Details(detailsAnimationView: "32", detailsDayLabel: "12. Gün", detailsTextView: "Yetersiz ve dengesiz beslenme, bağışıklık sisteminin zayıflamasına yol açar. Bunun sonucunda da diş eti enfeksiyonuyla mücadelede vücudun gardı düşer. A, B, C ve K vitamini eksikliklerinde yoğun diş eti kanamaları oluşur. Bu durumda mutlaka vitamin takviyesi yapılması ve besin maddelerinin vücudun ihtiyacı oranında tüketilmesi gerekir.")
            let details13 = Details(detailsAnimationView: "11", detailsDayLabel: "13. Gün", detailsTextView: "Yapılan araştırmalar sonucunda, diyabet sorunu olanların diş eti sağlığı açısından daha yüksek riske sahip oldukları ortaya konulmuş. Diyabet, tükürükteki azalmayla birlikte ağız kuruluğuna, yara iyileşmesinde yavaşlamaya ve damarlarda hasara neden olarak diş etlerini enfeksiyona açık hale getirir. Diyabetli hastalarda diş etlerinde şişlik ve kanamalar, çene kemiğinde erimeler, dişlerde sallantılar görülebilir. Bu nedenle ağız içerisinde oluşan değişimler mutlaka doktora söylenmeli. Hastalığın kontrol altında tutulması diş eti sağlığı açısından önem taşır.")
            let details14 = Details(detailsAnimationView: "33", detailsDayLabel: "14. Gün", detailsTextView: "Ferah bir nefese sahip olmaya yardımcı diğer yöntemler ise:Baharatlar, sarımsak ve soğan, kahve ve alkol gibi dönemsel olarak ağız kokusu kokusuna sebep olan yiyecek ve içeceklerden uzak durmak.Sigara içmeyi bırakmak. Sigara içmek kötü ağız kokusuna, dişlerin lekelenmesine sebep olur. Daha ferah nefes ve beyaz dişler için sigarayı bırakın.Bol bol su içerek ağzınızdaki hücreleri nemlendirerek plakları uzaklaştırmaya yardımcı olabilirsiniz ve böylelikle ağız kokusundan korunursunuz.Ağız kokusu gastrointestinal, boğaz ve göğüs enfeksiyonları gibi bazı tıbbi durumlardan da kaynaklanıyor olabilir.")
            let details15 = Details(detailsAnimationView: "13", detailsDayLabel: "15. Gün", detailsTextView: "İçeceklerinizde ve uygun yiyeceklerinizde tarçın kullanabilirsiniz. Tarçın ağız içi bakterilerle mücadelede önemli bir silahtır. Eğer varsa tarçınlı şekersiz sakızlar da uygun bir öneri olabilir. Özellikle yaşla artan vücut kuruması pek çok yönden dikkat edilmesi gereken bir durumdur. Çok su içmek onlarca diğer yararının yanında dilinizin kurumasını da önleyerek ağız kokusu ile mücadelede önemli bir silah olarak kullanılabilir. Su ağız içindeki bakterilerin minimumda tutulması için direk yardımcıdır. Ayrıca tükürük salgısını artırarak da yardımcı olur")
            let details16 = Details(detailsAnimationView: "14", detailsDayLabel: "16. Gün", detailsTextView: "Diş çürükleri, diş eti iltihapları ağız kokusunun önemli nedenlerindendir. Ağız içi herhangi bir enfeksiyon bakteri üremesini artıracağı için daima ağız kokusuna neden olur. Bu nedenle diş hekimizin önerilerini mutlaka dinlemelisiniz.Sinüzit gibi hava yolu rahatsızlıkları ve burun tıkanmasına neden olan diğer durumlar geceleri ağızdan nefes almamıza neden olur. Bu durum ağzı ve boğazı kurutarak bakterilerin üremesi için ideal bir ortam oluşturur. Azalan tükürük salgısı durumu daha kötü hale getirir. Bu nedenle kesinlikle burnunuz tıkalı uyumamalısınız.")
            let details17 = Details(detailsAnimationView: "15", detailsDayLabel: "17. Gün", detailsTextView: "Beyaz un, beyaz şeker, glukoz/ fruktoz şurubu ile tatlandırılmış tüm hazır gıdalar ağız içindeki bakteriler için inanılmaz bir hazinedir. Bu tür şekerleri çok kolay kullanarak hızla çoğalırlar. Basit şekerler (atıştırmalık tüm şekerli gıdalarda olduğu gibi) diş çürüklerine neden olur ve ağız sağlığını büyük bir süratle bozarlar. Bu nedenle basit şeker tüketiminizi azaltmalısınız. Bu da su içmek gibi size onlarca yararın yanında ağız kokunuzun azalmasına da yardım edecektir.")
            let details18 = Details(detailsAnimationView: "34", detailsDayLabel: "18. Gün", detailsTextView: "Sigara içmek ağız kuruluğuna neden olduğundan ağız kokusuna sebep olur. Ayrıca diğer bir ağız kokusu nedeni olan diş eti hastalıklarına da zemin hazırlar.")
            let details19 = Details(detailsAnimationView: "17", detailsDayLabel: "19. Gün", detailsTextView: "Karbonat ile diş beyazlatma geleneksel fakat çok etkili sonuçlar veren bir yöntemdir.Hatta bu yöntem için diş beyazlatma çeşitleri arasında en güçlü etkiye sahip olanıdır, diyebiliriz.Yapmanız gereken diş fırçanızı ıslatın ve biraz karbonata batırın. Daha sonra dişlerinizi fırçalayın.")
            let details20 = Details(detailsAnimationView: "18", detailsDayLabel: "20. Gün", detailsTextView: "Ağız, insan vücudunun giriş kapısı olması nedeniyle, en çok bakteri ve mikrobun bulunduğu bir bölgedir. Bundan dolayı temizliği çok önemlidir. Bu da diş fırçalayarak ve gargara yaparak sağlanabilir. Yediğimiz yiyecekler  ağızda gerekli temizlik yapılmazsa bakteri plakları oluşur ve bu da dişlerin çürümesine ve dişlerin iltihaplanmasına yol açar. Bu yüzden   diş boşluğu boşluğu, üzücü sonuçlara yol açabilir. Bakteri etkisiyle yemek artıklarının çürüme ve fermantasyona tabi olacaktır. Buna ek olarak, yumuşak diş minesini tahrip eden asit, çürüme neden olacaktır. Bu dişler sadece zarar vermez, aynı zamanda iç organlarda oluşan hastalık, vücudun koruyucu yeteneğini azaltır ve hoş olmayan ağız kokusuna neden olur.")
            let details21 = Details(detailsAnimationView: "19", detailsDayLabel: "21. Gün", detailsTextView: "Diş fırçalama en az 3 dakika sürmelidir; Orta sertlikte fırça olmalıdır.Dişlerin günde iki kez: sabah Kahvaltısı ve akşam yemeğinden sonra dişlerinizi fırçalayın ağız hijyeni bir klasik hale getirilmelidir. Harcama hijyen prosedürleri sabah yemekten önce nadir değil, alışkanlık olmalıdır. Birçok kişi için sabah yemeğinden önce dişlerini fırçalamak bir alışkanlıktır. Ama kahvaltıdan sonra yapmanız gereken çok önemli bir işlemdir")
            let details22 = Details(detailsAnimationView: "20", detailsDayLabel: "22. Gün", detailsTextView: "Dişlerimizi sert fırçalarsak dişlerimize ve dişetlerimize zarar verebiliriz. Sert fırçalamak dişlerin aşınmasına, dişetlerinin çekilmesine ve diş hassasiyetinin oluşmasına neden olabilir.")
            let details23 = Details(detailsAnimationView: "21", detailsDayLabel: "23. Gün", detailsTextView: "Dişimiz şiştiğinde hemen bir diş hekimine gitmeliyiz; çünkü en uygun tedaviyi hiç şüphesiz diş hekiminiz uygulayacaktır. Antibiyotik mutlaka gerekiyor ise, diş hekimi kontrolünde alınmalıdır.İltihaplı dişlerde sadece ilaç kullanılması yeterli değildir.Antibiyotik kullanılması ile sorun geçmiş gibi görünse de dişteki iltihap tam olarak iyileşmez; akut enfeksiyon kronik enfeksiyon haline geçebilir ve bir süre hiç belirti vermeden durabilir. Ancak bu dönemde, sorun sinsice ilerleyerek dişinize ve diş çevresine zarar verir; kısa süreliğine geçen şişlik ve ağrı bir süre sonra mutlaka tekrar eder.Bu nedenlerle, dişimizde bir sorun olduğunda mutlaka diş hekimine giderek nedeni öğrenmeniz ve gerekli tedaviyi yaptırmanız gerekir.")
            let details24 = Details(detailsAnimationView: "22", detailsDayLabel: "24. Gün", detailsTextView: "İyi bir ağız hijyeni olmazsa olmazdır, ancak dişleri lekelediği düşünülen asit ve renklere sahip yiyecek ve içeceklerden kaçınarak yeni lekelenmelerden veya derinleşen lekelerden de kaçınabilirsiniz. Kırmızı şarap, çilek ve kahve gibi yoğun pigmentli yiyecekler bir atıştırmalık olmalı, ancak gün boyunca tükettiğiniz bir şey olmamalıdır. Bu yiyecek ve içecek parçacıklarını tükettikten kısa bir süre sonra dişlerinizi fırçalamayı unutmayın.")
            let details25 = Details(detailsAnimationView: "23", detailsDayLabel: "25. Gün", detailsTextView: "Diş fırçası ne çok sert ne de çok yumuşak olmalıdır, ancak kişinin çok hassas bir diş eti varsa ya da hastaysa yumuşak kıllı fırçaları tercih etmesi uygundur, normal bir yetişkin tarafından kullanılan diş fırçasının orta sertlikte kıllara sahip olması ve baş kısmının ağza uygun büyüklükte olması gerekmektedir.")
            let details26 = Details(detailsAnimationView: "24", detailsDayLabel: "26. Gün", detailsTextView: "Diş minesi zayıfladığı için gülümsemeniz arzuladığınız kadar parlak olmayabilir. American Dental Association'a (ADA) göre, diş minesi sert bir maddedir. Aşındığında kendi kendini onaramaz. Ağız hastalığı, diş minesini etkilediğinde onu eski haline döndüremezsiniz ve zayıf diş minesi çürümeye ve kaviteye daha duyarlı hale gelebilir. Diş minesi korumasının işe yaradığı nokta burasıdır. Çoğu diş macununda bulunan florür, asitli yiyecek ve içeceklerle ilişkili aşınma ve yıpranmaya karşı diş minesini güçlendirmeye yardımcı olabilir, bu da zayıf diş minesi üzerinde daha az leke anlamına gelir.")
            let details27 = Details(detailsAnimationView: "25", detailsDayLabel: "27. Gün", detailsTextView: "ADA'ya göre, kalsiyum açısından zengin yiyecekler tüketmek diş minesini güçlendirmeye yardımcı olur. Sağlıklı diş minesi, altındaki dentin tabakasının görünmediği ve dişlerinizin daha beyaz renkte görünmesine neden olduğu anlamına gelir. Süt ürünleri ve süt ürünü olmayan kalsiyum bakımından zengin yiyecekler dişlerinize onların minesini sağlıklı tutmak için ihtiyaç duydukları mineralleri sağlar. Ağız hijyeninin kendisi, dişlerinizin görünümünü iyileştiremediğinde, bu diğer seçenekleri göz önünde bulundurmanızın zamanı gelmiş demektir. Yüzeysel lekeleri çıkarma ve parlak bir gülümsemeyi sürdürme önerileriyle ilgili diş hekiminizle görüşün.")
            let details28 = Details(detailsAnimationView: "28", detailsDayLabel: "28. Gün", detailsTextView: "“Ağız kokusu neden olur?” birçok kişi tarafından merak edilen bir konudur. Ağız kokusu sebepleri aşağıdaki gibi sıralanabilir: Gıdalar: Dişlerin arasındaki veya çevresindeki biriken yiyecek parçacıklarının parçalanması bakterileri artırabilir ve kötü kokuya neden olabilir. Soğan, sarımsak ve baharat gibi bazı yiyeceklerin tüketilmesi de ağız kokusuna neden olabilir.Tütün ürünleri: Sigara içmek hoş olmayan ağız kokusuna neden olur. Sigara içenlerin ve diğer tütün ürünleri kullanıcılarının, bir başka ağız kokusu kaynağı olan diş eti hastalığına sahip olma olasılıkları daha yüksektir.Yetersiz diş bakımı: Düzenli diş fırçalamayan ve diş ipi kullanmayan bireylerde, yiyecek parçacıkları ağızda kalıp ağız kokusuna neden olur. Bu gibi durumlarda, dişlerde renksiz ve yapışkan bir bakteri plağı oluşur. Bakteri plağı temizlenmediği takdirde, diş etlerini tahriş edebilir ve sonunda diş ve diş etlerinin arasında plak dolgulu cepler oluşturabilir (periodontitis). Dil ayrıca koku üreten bakterileri de hapsedebilir. Düzenli olarak temizlenmeyen veya uygun şekilde takılmayan protezler, kokuya neden olan bakteri ve yiyecek parçacıklarını barındırabilir.")
            let details29 = Details(detailsAnimationView: "27", detailsDayLabel: "29. Gün", detailsTextView: "Ağız sağlığınız açısından seçeceğiniz diş macununun sahip olması gereken özellikler şunlardır:Olmazsa olmaz diş minesini koruyucu madde florür bulunmalı,Diş çürümesine sebep olacak şekerli tatlandırıcılar bulunmamalı,Gliserol ve sorbitol gibi diş macunun kurumasını engelleyen maddeler yer bulunmalı,Dişinizin ihtiyacınıza ya da dişinizin yapısına uygun bir formül barındırmalı.")
            let details30 = Details(detailsAnimationView: "26", detailsDayLabel: "30. Gün", detailsTextView: "Bugün 30.Gün 🫡 . Seni tebrik ederim .Uygulamayı tekrardan kullanmak istersen tamamladığın günlere en baştan başlayabilrsin . Diğer uygulamam CHECK indirip bana destek olursan çok mutlu olurum 😇 ")
            
        
        myDetails.append(details1)
        myDetails.append(details2)
        myDetails.append(details3)
        myDetails.append(details4)
        myDetails.append(details5)
        myDetails.append(details6)
        myDetails.append(details7)
        myDetails.append(details8)
        myDetails.append(details9)
        myDetails.append(details10)
        myDetails.append(details11)
        myDetails.append(details12)
        myDetails.append(details13)
        myDetails.append(details14)
        myDetails.append(details15)
        myDetails.append(details16)
        myDetails.append(details17)
        myDetails.append(details18)
        myDetails.append(details19)
        myDetails.append(details20)
        myDetails.append(details21)
        myDetails.append(details22)
        myDetails.append(details23)
        myDetails.append(details24)
        myDetails.append(details25)
        myDetails.append(details26)
        myDetails.append(details27)
        myDetails.append(details28)
        myDetails.append(details29)
        myDetails.append(details30)

    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        
        tableView.reloadData()
    }
    
    
    // MARK: - Functions
    
    func modelsArray(){
        
        mainModels = [
        
            MainModels(dayNumber: "1. Gün", backgroundImages: UIImage(named: "1")!),
            MainModels(dayNumber: "2. Gün", backgroundImages: UIImage(named: "2")!),
            MainModels(dayNumber: "3. Gün", backgroundImages: UIImage(named: "3")!),
            MainModels(dayNumber: "4. Gün", backgroundImages: UIImage(named: "4")!),
            MainModels(dayNumber: "5. Gün", backgroundImages: UIImage(named: "5")!),
            MainModels(dayNumber: "6. Gün", backgroundImages: UIImage(named: "6")!),
            MainModels(dayNumber: "7. Gün", backgroundImages: UIImage(named: "7")!),
            MainModels(dayNumber: "8. Gün", backgroundImages: UIImage(named: "8")!),
            MainModels(dayNumber: "9. Gün", backgroundImages: UIImage(named: "9")!),
            MainModels(dayNumber: "10. Gün", backgroundImages: UIImage(named: "10")!),
            MainModels(dayNumber: "11. Gün", backgroundImages: UIImage(named: "1")!),
            MainModels(dayNumber: "12. Gün", backgroundImages: UIImage(named: "2")!),
            MainModels(dayNumber: "13. Gün", backgroundImages: UIImage(named: "3")!),
            MainModels(dayNumber: "14. Gün", backgroundImages: UIImage(named: "4")!),
            MainModels(dayNumber: "15. Gün", backgroundImages: UIImage(named: "5")!),
            MainModels(dayNumber: "16. Gün", backgroundImages: UIImage(named: "6")!),
            MainModels(dayNumber: "17. Gün", backgroundImages: UIImage(named: "7")!),
            MainModels(dayNumber: "18. Gün", backgroundImages: UIImage(named: "8")!),
            MainModels(dayNumber: "19. Gün", backgroundImages: UIImage(named: "9")!),
            MainModels(dayNumber: "20. Gün", backgroundImages: UIImage(named: "10")!),
            MainModels(dayNumber: "21. Gün", backgroundImages: UIImage(named: "1")!),
            MainModels(dayNumber: "22. Gün", backgroundImages: UIImage(named: "2")!),
            MainModels(dayNumber: "23. Gün", backgroundImages: UIImage(named: "3")!),
            MainModels(dayNumber: "24. Gün", backgroundImages: UIImage(named: "4")!),
            MainModels(dayNumber: "25. Gün", backgroundImages: UIImage(named: "5")!),
            MainModels(dayNumber: "26. Gün", backgroundImages: UIImage(named: "6")!),
            MainModels(dayNumber: "27. Gün", backgroundImages: UIImage(named: "7")!),
            MainModels(dayNumber: "28. Gün", backgroundImages: UIImage(named: "8")!),
            MainModels(dayNumber: "29. Gün", backgroundImages: UIImage(named: "9")!),
            MainModels(dayNumber: "30. Gün", backgroundImages: UIImage(named: "10")!),
        ]
        
    }
    

    // MARK: - Actions
    
    
    @IBAction func completeButton(_ sender: UIButton) {
        
        let buttonPosition = sender.convert(CGPoint.zero, to: self.tableView)
        let indxPath = tableView.indexPathForRow(at: buttonPosition)
        
        if itemCD[indxPath!.row].done {
            sender.setImage(UIImage(systemName: "checkmark.seal.fill"), for: .normal)
        } else {
            sender.setImage(UIImage(systemName: "checkmark.seal"), for: .normal)
        }
        
        itemCD[indxPath!.row].done = !itemCD[indxPath!.row].done
        saveItems()
        
    }
    
  
    
}

extension MainViewController:UITableViewDelegate,UITableViewDataSource{
 
    
    
    // dataSorce
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mainModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MainTableViewCell
        cell.setup(mainModels[indexPath.row])
        
        if itemCD.count < mainModels.count {
            let newItem = Item(context: context)
            newItem.done = false
            itemCD.append(newItem)
        }
        
        
        if itemCD[indexPath.row].done {
            cell.completeButton.setImage(UIImage(systemName: "checkmark.seal"), for: .normal)
        } else {
            cell.completeButton.setImage(UIImage(systemName: "checkmark.seal.fill"), for: .normal)
            
        }
      
        saveItems()
        
      
        return cell
        
    }
    
    // delegate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MainTableViewCell
        let selectCell = cell.setup(mainModels[indexPath.row])
        chosenDay = myDetails[indexPath.row]
        sendTheIndexPathRow = indexPath.row

      
        self.performSegue(withIdentifier: "toDetailsVC", sender: nil)
        
    }
    
 
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailsVC" {
            
            let destinationVC = segue.destination as! DetailViewController
            destinationVC.selectedDetails = chosenDay
            
            destinationVC.getIndexPathRow = sendTheIndexPathRow
            
           
        }
    }
    
    
    
   // MARK: - Core Data veri kaydı
    
        func saveItems() {
            do {
                try context.save()
            } catch {
                print("Error saving context (HomeVC) \(error)")
            }
        }

        func loadItems() {
            let request : NSFetchRequest<Item> = Item.fetchRequest()
            do {
                itemCD = try context.fetch(request)
            } catch {
                print("Error fetching data from context \(error)")
            }
        }
    

    
}

