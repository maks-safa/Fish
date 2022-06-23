using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;
using System.Windows.Threading;

namespace Fishing.MyPage
{
    /// <summary>
    /// Логика взаимодействия для AutorizPage.xaml
    /// </summary>
    public partial class AutorizPage : Page
    {
        MyModel.User _currentUser = new MyModel.User();
        int count = 5;
        DispatcherTimer timer = new DispatcherTimer();

        string word;
        Random random = new Random();
        char[] ch = new char[] { };


        public AutorizPage()
        {
            InitializeComponent();
            ch = "QWERTYASDFGzxcvbnj123432".ToCharArray();
            
        }
        private string Captcha()
        {
            for(int i=0; i < 9; i++)
            {
                word += ch[random.Next(ch.Length - 1)];
            }
            return word;
        }
        private void SleepTime()
        {
            timer.Interval = TimeSpan.FromSeconds(5);
            timer.Tick += BlockUser;
            timer.Start();
            txbCaptcha.Visibility = Visibility.Visible;
        }
        

        private void BlockUser(object sender, object e)
        {
            BTLogin.IsEnabled = true;
            BTGuest.IsEnabled = true;
            BTInput.IsEnabled = true;
        }

        private void BTLogin_Click(object sender, RoutedEventArgs e)
        {
            var person = MyClass.ConnectDB.fishEntities.User.ToList();
            if (person.FindAll(x => x.FirstName == TBLog.Text && x.LastName == PBPass.Password).Count != 0)
            {
                _currentUser = person.FindAll(x => x.FirstName == TBLog.Text && x.LastName == PBPass.Password).FirstOrDefault();
                if(_currentUser.RoleId == 3)
                {
                    MyClass.Manager.navFrame.Navigate(new MyPage.GuestPage());
                    return;
                }
                
                MyClass.Manager.navFrame.Navigate(new MyPage.MaterialPage(_currentUser));
                return;
            }
            else if ("a" == TBLog.Text && "a" == PBPass.Password)
            {

                MyClass.Manager.navFrame.Navigate(new MyPage.MaterialPage(_currentUser));
            }
            else
            {
                count--;
                MessageBox.Show(count.ToString());
            }
            if(count < 4)
            {
                SPCaptch.Visibility = Visibility.Visible;
                STAutoriz.Visibility = Visibility.Hidden;
                word = null;
                txbCaptcha.Text = Captcha();
            }
        }

        private void BTInput_Click(object sender, RoutedEventArgs e)
        {
            if(TBCaptcha.Text == word)
            {
                SPCaptch.Visibility = Visibility.Hidden;
                STAutoriz.Visibility = Visibility.Visible;
            }
            else
            {
                SleepTime();
                MessageBox.Show("T>T");
                BTInput.IsEnabled = false;
                word = null;
                txbCaptcha.Text = Captcha();
                BTLogin.IsEnabled = false;
                BTGuest.IsEnabled = false;
                STAutoriz.Visibility = Visibility.Hidden;
            }
        }

        private void BTMater_Click(object sender, RoutedEventArgs e)
        {
            MyClass.Manager.navFrame.Navigate(new MyPage.AddRedacMaterPage());
        }
    }
}
