Deface::Override.new(
  virtual_path: 'spree/admin/products/_form',
  name: 'Enable vendors to manage product master price',
  replace: 'div[data-hook="admin_product_form_price"]',
  text: <<-HTML
         <div data-hook="admin_product_form_price">
          <%= f.field_container :price, class: ['form-group'] do %>
            <%= f.label :price, raw(Spree.t(:master_price) + content_tag(:span, ' *', class: "required")) %>
            <%= f.text_field :price, value: number_to_currency(@product.price, unit: ''), class: 'form-control', disabled: (cannot? :update, Spree::Price) %>
            <%= f.error_message_on :price %>
          <% end %>
         </div>
        HTML
)

Deface::Override.new(
  virtual_path: 'spree/admin/products/_form',
  name: 'product status dropdown',
  insert_before: 'div[data-hook="admin_product_form_price"]',
  text: <<-HTML
            <div data-hook="admin_product_form_status">
              <% if can? :manage, Spree::Product %>
                <%= f.field_container :status, class: ['form-group'] do %>
                        <%= f.label :status, Spree.t(:status) %>
                        <%= select_tag "product[status]", options_for_select(::Spree::Product.statuses.map{|k,v| [k.humanize,k] },f.object.status), class: 'select2' %>
                        <%= f.error_message_on :status %>
                <% end %>
              <% else %>
                 <p>Product is : <%= @product.status%></p>
              <% end %>
            </div>
        HTML
)

