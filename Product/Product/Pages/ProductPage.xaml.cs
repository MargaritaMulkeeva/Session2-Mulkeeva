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

namespace Product.Pages
{
    /// <summary>
    /// Логика взаимодействия для ProductPage.xaml
    /// </summary>
    public partial class ProductPage : Page
    {
        public ProductPage()
        {
            InitializeComponent();
            //заполнение данными listview и combobox
            LV.ItemsSource = user15Entities.GetContext().Products.ToList();
            var filtr = user15Entities.GetContext().TypeOfProduct.ToList();
            filtr.Insert(0, new TypeOfProduct() { TypeOfProduct1 = "Все типы" });
            CBFiltr.ItemsSource = filtr;
            
        }

        //переход на окно с добавлением
        private void BtnAdd_Click(object sender, RoutedEventArgs e)
        {
            Manager.frame.Navigate(new AddEditPages.AddEditProduct(null));
        }

        //переход на окно с редактированием
        private void BtnEdit_Click(object sender, RoutedEventArgs e)
        {
            Manager.frame.Navigate(new AddEditPages.AddEditProduct(LV.SelectedItem as Products));
        }

        //поиск
        private void TBSearch_TextChanged(object sender, TextChangedEventArgs e)
        {
            if (TBSearch.Text == "")
                LV.ItemsSource = user15Entities.GetContext().Products.ToList();
            else
                LV.ItemsSource = user15Entities.GetContext().Products.Where(a => (a.NameOfProduct + "" + a.TypeOfProduct.TypeOfProduct1).ToLower().Contains(TBSearch.Text.ToLower())).ToList();
        }

        //сортировка
        private void CBSort_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            switch (CBSort.SelectedIndex)
            {
                case 0:
                    LV.ItemsSource = user15Entities.GetContext().Products.OrderBy(a => a.MinPrice).ToList();
                    break;
                case 1:
                    LV.ItemsSource = user15Entities.GetContext().Products.OrderByDescending(a => a.MinPrice).ToList();
                    break;
            }
        }

        //фильтрация
        private void CBFiltr_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            var option = CBFiltr.SelectedItem as TypeOfProduct;
            if (option.TypeOfProduct1 == "Все типы")
                LV.ItemsSource = user15Entities.GetContext().Products.ToList();
            else
                LV.ItemsSource = user15Entities.GetContext().Products.Where(a => a.ID == option.ID).ToList();
        }
    }
}
