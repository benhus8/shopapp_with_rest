import React from 'react';
import ProductService from '../services/ProductService';

class ProductComponent extends React.Component {

    constructor (props) {
        super(props)
        this.state = {
            products : []
        }
    }

    componentDidMount(){
        ProductService.getProducts().then((response) => {
            this.setState({products:response.data})
        });
    }

    render() {
        return(
            <div>
                <h1 className = "text-center">Lista produktów w sklepie</h1>
                <table className = "table table-stripped">
                    <thead>
                        <tr>

                            <td> Cena </td>
                            <td> Dostępność </td>
                            <td> Kategoria </td>
                            <td> Kraj pochodzenia </td>
                            <td> Nazwa </td>

                        </tr>
                    </thead>
                    <tbody>
                        {
                            this.state.products.map(
                                product =>
                                <tr key = {product.cena}>

                                    <td>{product.cena}</td>
                                    <td>{product.dostepnosc.toString()}</td>
                                    <td>{product.kategoria}</td>
                                    <td>{product.kraj_pochodzenia}</td>
                                    <td>{product.nazwa}</td>

                                </tr>
                            )
                        }
                    </tbody>
                </table>
            </div>
        )
}
}

export default ProductComponent