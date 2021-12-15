using Product.Pages;
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

namespace Product.AddEditPages
{
    /// <summary>
    /// Логика взаимодействия для AddEditProduct.xaml
    /// </summary>
    public partial class AddEditProduct : Page
    {
        Products products = new Products();
        public AddEditProduct(Products _prod)
        {           
            InitializeComponent();
            //заполнение страницы данными
            if (_prod != null)
            {
                products = _prod;
                btnDelete.IsEnabled = true;
            }
            else
            {
                products = new Products();
                btnDelete.IsEnabled = false;
            }
               
            DataContext = products;
            CBType.ItemsSource = user15Entities.GetContext().TypeOfProduct.ToList();
        }

        //метод перехода назад
        private void BtnBack_Click(object sender, RoutedEventArgs e)
        {
            Manager.frame.Navigate(new ProductPage());
        }

        //удаление
        private void BtnDelete_Click(object sender, RoutedEventArgs e)
        {
            if (MessageBox.Show("Вы точно хотите удалить выбранный элемент?", "Внимание!", MessageBoxButton.YesNo, MessageBoxImage.Question) == MessageBoxResult.Yes)
            {
                try
                {
                    user15Entities.GetContext().Products.Remove(products);
                    user15Entities.GetContext().SaveChanges();
                    Manager.frame.Navigate(new ProductPage());
                }
                catch (Exception ex)
                {
                    MessageBox.Show(ex.ToString());
                }
            }
        }

        //добавление и изменение
        private void BtnEdit_Click(object sender, RoutedEventArgs e)
        {
            if (TBArticle.Text != "" && TBCount.Text != "" && TBName.Text != "" && CBType.SelectedItem != null)
            {
                if (products.ID == 0)
                    user15Entities.GetContext().Products.Add(products);
                user15Entities.GetContext().SaveChanges();
                MessageBox.Show("Всё успешно!", "Внимание!", MessageBoxButton.OK, MessageBoxImage.Information);
                Manager.frame.Navigate(new ProductPage());
            }
            else
                MessageBox.Show("Заполните все поля", "Внимание!", MessageBoxButton.OK, MessageBoxImage.Error);
        }
    }
}
