class Selenium::WebStorageManager
  enum StorageType
    LocalStorage
    SessionStorage
  end

  getter document_manager : DocumentManager

  forward_missing_to @document_manager

  def initialize(@document_manager, @storage : StorageType = StorageType::LocalStorage)
  end

  # Clear all items from the Storage
  def clear
    document_manager.execute_script("#{storage_type_in_js}.clear()")
  end

  # Retrieve and insert item from/into the Storage.
  # If no value is given, it will return the item specified in `name`.
  # For a given `value`, it will be added or updated for the item specified in `name`.
  def item(name : String, value = nil) : String | Nil
    if value.nil?
      document_manager.execute_script("return #{storage_type_in_js}.getItem('#{name}')")
    else
      document_manager.execute_script("#{storage_type_in_js}.setItem('#{name}', '#{value}')")
    end
  end

  # Retrieve the list of keys from the Storage
  def keys : JSON::Any
    str = document_manager.execute_script("return Object.keys(#{storage_type_in_js})")
    JSON.parse(str)
  end

  # Remove the item specified in `name` from the Storage
  def remove(name : String)
    document_manager.execute_script("#{storage_type_in_js}.removeItem('#{name}')")
  end

  # Retrieve the number of items in the Storage
  def size : Int
    document_manager.execute_script("return #{storage_type_in_js}.length").to_i
  end

  # TODO: Add doc
  private def storage_type_in_js
    "window.#{@storage.to_s.camelcase(lower: true)}"
  end
end
