// ===== 1D ===== //

#[cfg(test)]
mod tensor_1D {
    use array::ArrayTrait;
    use array::SpanTrait;

    use orion::operators::tensor::implementations::impl_tensor_i32::Tensor_i32;
    use orion::operators::tensor::core::{TensorTrait, ExtraParams};
    use orion::tests::helpers::tensor::i32::i32_tensor_1x3_helper;


    #[test]
    #[should_panic(expected: ('cannot transpose a 1D tensor', ))]
    #[available_gas(2000000)]
    fn tensor_transpose() {
        let mut axes: Array<usize> = ArrayTrait::new();
        axes.append(1);

        let tensor = i32_tensor_1x3_helper();

        let result = tensor.transpose(axes.span());
    }
}

// ===== 2D ===== //

#[cfg(test)]
mod tensor_2D {
    use array::ArrayTrait;
    use array::SpanTrait;

    use orion::operators::tensor::implementations::impl_tensor_i32::Tensor_i32;
    use orion::operators::tensor::core::{TensorTrait, ExtraParams};
    use orion::tests::helpers::tensor::i32::{
        i32_tensor_2x2_helper, i32_tensor_3x2_helper, i32_tensor_2x3_helper
    };


    #[test]
    #[available_gas(20000000)]
    fn tensor_transpose() {
        let mut axes: Array<usize> = ArrayTrait::new();
        axes.append(1);
        axes.append(0);

        let tensor = i32_tensor_2x2_helper();

        let result = tensor.transpose(axes.span());

        assert(*result.data.at(0).mag == 0, 'result[0] = 0');
        assert(*result.data.at(1).mag == 2, 'result[1] = 2');
        assert(*result.data.at(2).mag == 1, 'result[2] = 1');
        assert(*result.data.at(3).mag == 3, 'result[3] = 3');
        assert(*result.shape.at(0) == 2, 'shape[0] = 2');
        assert(*result.shape.at(1) == 2, 'shape[1] = 2');

        let tensor = i32_tensor_3x2_helper();

        let result = tensor.transpose(axes.span());

        assert(*result.data.at(0).mag == 0, 'result[0] = 0');
        assert(*result.data.at(1).mag == 2, 'result[1] = 2');
        assert(*result.data.at(2).mag == 4, 'result[2] = 4');
        assert(*result.data.at(3).mag == 1, 'result[3] = 1');
        assert(*result.data.at(4).mag == 3, 'result[4] = 3');
        assert(*result.data.at(5).mag == 5, 'result[5] = 5');
        assert(*result.shape.at(0) == 2, 'shape[0] = 2');
        assert(*result.shape.at(1) == 3, 'shape[1] = 3');

        let tensor = i32_tensor_2x3_helper();

        let result = tensor.transpose(axes.span());

        assert(*result.data.at(0).mag == 0, 'result[0] = 0');
        assert(*result.data.at(1).mag == 3, 'result[1] = 3');
        assert(*result.data.at(2).mag == 1, 'result[2] = 1');
        assert(*result.data.at(3).mag == 4, 'result[3] = 4');
        assert(*result.data.at(4).mag == 2, 'result[4] = 2');
        assert(*result.data.at(5).mag == 5, 'result[5] = 5');
        assert(*result.shape.at(0) == 3, 'shape[0] = 3');
        assert(*result.shape.at(1) == 2, 'shape[1] = 2');
    }
}

// ===== 3D ===== //

#[cfg(test)]
mod tensor_3D {
    use array::ArrayTrait;
    use array::SpanTrait;

    use orion::operators::tensor::implementations::impl_tensor_i32::Tensor_i32;
    use orion::operators::tensor::core::{TensorTrait, ExtraParams};
    use orion::tests::helpers::tensor::i32::{
        i32_tensor_2x2x2_helper, i32_tensor_3x2x2_helper, i32_tensor_2x3_helper
    };

    #[test]
    #[available_gas(20000000)]
    fn tensor_transpose() {
        let tensor = i32_tensor_2x2x2_helper();

        let mut axes: Array<usize> = ArrayTrait::new();
        axes.append(1);
        axes.append(2);
        axes.append(0);

        let result = tensor.transpose(axes.span()).data;

        assert(*result.at(0).mag == 0, 'result[0] = 0');
        assert(*result.at(1).mag == 4, 'result[1] = 4');
        assert(*result.at(2).mag == 1, 'result[2] = 1');
        assert(*result.at(3).mag == 5, 'result[3] = 5');
        assert(*result.at(4).mag == 2, 'result[4] = 2');
        assert(*result.at(5).mag == 6, 'result[5] = 6');
        assert(*result.at(6).mag == 3, 'result[6] = 3');
        assert(*result.at(7).mag == 7, 'result[7] = 7');

        let mut axes: Array<usize> = ArrayTrait::new();
        axes.append(2);
        axes.append(1);
        axes.append(0);

        let result = tensor.transpose(axes.span()).data;

        assert(*result.at(0).mag == 0, 'result[0] = 0');
        assert(*result.at(1).mag == 4, 'result[1] = 4');
        assert(*result.at(2).mag == 2, 'result[2] = 2');
        assert(*result.at(3).mag == 6, 'result[3] = 6');
        assert(*result.at(4).mag == 1, 'result[4] = 1');
        assert(*result.at(5).mag == 5, 'result[5] = 5');
        assert(*result.at(6).mag == 3, 'result[6] = 3');
        assert(*result.at(7).mag == 7, 'result[7] = 7');

        let mut axes: Array<usize> = ArrayTrait::new();
        axes.append(0);
        axes.append(2);
        axes.append(1);

        let result = tensor.transpose(axes.span()).data;

        assert(*result.at(0).mag == 0, 'result[0] = 0');
        assert(*result.at(1).mag == 2, 'result[1] = 2');
        assert(*result.at(2).mag == 1, 'result[2] = 1');
        assert(*result.at(3).mag == 3, 'result[3] = 3');
        assert(*result.at(4).mag == 4, 'result[4] = 4');
        assert(*result.at(5).mag == 6, 'result[5] = 6');
        assert(*result.at(6).mag == 5, 'result[6] = 5');
        assert(*result.at(7).mag == 7, 'result[7] = 7');

        let tensor = i32_tensor_3x2x2_helper();

        let mut axes: Array<usize> = ArrayTrait::new();
        axes.append(1);
        axes.append(2);
        axes.append(0);

        let result = tensor.transpose(axes.span());

        assert(*result.data.at(0).mag == 0, 'result[0] = 0');
        assert(*result.data.at(1).mag == 4, 'result[1] = 4');
        assert(*result.data.at(2).mag == 8, 'result[2] = 8');
        assert(*result.data.at(3).mag == 1, 'result[3] = 1');
        assert(*result.data.at(4).mag == 5, 'result[4] = 5');
        assert(*result.data.at(5).mag == 9, 'result[5] = 9');
        assert(*result.data.at(6).mag == 2, 'result[6] = 2');
        assert(*result.data.at(7).mag == 6, 'result[7] = 6');
        assert(*result.data.at(8).mag == 10, 'result[8] = 10');
        assert(*result.data.at(9).mag == 3, 'result[9] = 3');
        assert(*result.data.at(10).mag == 7, 'result[10] = 7');
        assert(*result.data.at(11).mag == 11, 'result[11] = 11');
        assert(*result.shape.at(0) == 2, 'shape[0] = 2');
        assert(*result.shape.at(1) == 2, 'shape[1] = 2');
        assert(*result.shape.at(2) == 3, 'shape[2] = 3');

        let mut axes: Array<usize> = ArrayTrait::new();
        axes.append(2);
        axes.append(1);
        axes.append(0);

        let result = tensor.transpose(axes.span());

        assert(*result.data.at(0).mag == 0, 'result[0] = 0');
        assert(*result.data.at(1).mag == 4, 'result[1] = 4');
        assert(*result.data.at(2).mag == 8, 'result[2] = 8');
        assert(*result.data.at(3).mag == 2, 'result[3] = 2');
        assert(*result.data.at(4).mag == 6, 'result[4] = 6');
        assert(*result.data.at(5).mag == 10, 'result[5] = 10');
        assert(*result.data.at(6).mag == 1, 'result[6] = 1');
        assert(*result.data.at(7).mag == 5, 'result[7] = 5');
        assert(*result.data.at(8).mag == 9, 'result[8] = 9');
        assert(*result.data.at(9).mag == 3, 'result[9] = 3');
        assert(*result.data.at(10).mag == 7, 'result[10] = 7');
        assert(*result.data.at(11).mag == 11, 'result[11] = 11');
        assert(*result.shape.at(0) == 2, 'shape[0] = 2');
        assert(*result.shape.at(1) == 2, 'shape[1] = 2');
        assert(*result.shape.at(2) == 3, 'shape[2] = 3');

        let mut axes: Array<usize> = ArrayTrait::new();
        axes.append(0);
        axes.append(2);
        axes.append(1);

        let result = tensor.transpose(axes.span());

        assert(*result.data.at(0).mag == 0, 'result[0] = 0');
        assert(*result.data.at(1).mag == 2, 'result[1] = 2');
        assert(*result.data.at(2).mag == 1, 'result[2] = 1');
        assert(*result.data.at(3).mag == 3, 'result[3] = 3');
        assert(*result.data.at(4).mag == 4, 'result[4] = 4');
        assert(*result.data.at(5).mag == 6, 'result[5] = 6');
        assert(*result.data.at(6).mag == 5, 'result[6] = 5');
        assert(*result.data.at(7).mag == 7, 'result[7] = 7');
        assert(*result.data.at(8).mag == 8, 'result[8] = 8');
        assert(*result.data.at(9).mag == 10, 'result[9] = 10');
        assert(*result.data.at(10).mag == 9, 'result[10] = 9');
        assert(*result.data.at(11).mag == 11, 'result[11] = 11');
        assert(*result.shape.at(0) == 3, 'shape[0] = 3');
        assert(*result.shape.at(1) == 2, 'shape[1] = 2');
        assert(*result.shape.at(2) == 2, 'shape[2] = 2');
    }
}
